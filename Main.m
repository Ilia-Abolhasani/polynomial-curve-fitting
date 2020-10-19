clc;clear;close all;
%%
load('Model.mat');
Degree=3;
%% PSO
disp('Starting PSO ...');
%% 
nVar=Degree+2;    % Number of Decision Variables
VarSize=[1 nVar];   % Size of Decision Variables Matrix
Alpha=0.75;
VarMin=-(10^Alpha);
VarMax=10^Alpha;
%% PSO Parameters
MaxIt=1000;      % Maximum Number of Iterations
nPop=10;        % Population Size (Swarm Size)
w=1;            % Inertia Weight
wdamp=0.99;     % Inertia Weight Damping Ratio
c1=1;           % Personal Learning Coefficient
c2=2;           % Global Learning Coefficient
VelMax=0.1*(VarMax-VarMin);
VelMin=-VelMax;
%% Initialization
empty_particle.Position=[];
empty_particle.Cost=[];
empty_particle.Velocity=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];
particle=repmat(empty_particle,nPop,1);
BestSol.Cost=inf;
for i=1:nPop           
    particle(i).Position=unifrnd(VarMin,VarMax,VarSize);    
    particle(i).Velocity=zeros(VarSize);    % Initialize Velocity    
    particle(i).Cost=Fitness(particle(i).Position,Model,Degree);    % Evaluation
    % Update Personal Best
    particle(i).Best.Position=particle(i).Position;
    particle(i).Best.Cost=particle(i).Cost;    
    % Update Global Best
    if particle(i).Best.Cost<BestSol.Cost        
        BestSol=particle(i).Best;        
    end    
end
BestCost=zeros(MaxIt,1);
%% PSO Main Loop
for it=1:MaxIt    
    for i=1:nPop        
        % Update Velocity
        particle(i).Velocity = w*particle(i).Velocity ...
            +c1*rand(VarSize).*(particle(i).Best.Position-particle(i).Position) ...
            +c2*rand(VarSize).*(BestSol.Position-particle(i).Position);        
        % Apply Velocity Limits
        particle(i).Velocity = max(particle(i).Velocity,VelMin);
        particle(i).Velocity = min(particle(i).Velocity,VelMax);        
        % Update Position
        particle(i).Position = particle(i).Position + particle(i).Velocity;        
        % Velocity Mirror Effect
        IsOutside=(particle(i).Position<VarMin | particle(i).Position>VarMax);
        particle(i).Velocity(IsOutside)=-particle(i).Velocity(IsOutside);        
        % Apply Position Limits
        particle(i).Position = max(particle(i).Position,VarMin);
        particle(i).Position = min(particle(i).Position,VarMax);        
        % Evaluation
        particle(i).Cost = Fitness(particle(i).Position,Model,Degree);        
        % Update Personal Best
        if particle(i).Cost<particle(i).Best.Cost          
           particle(i).Best.Position=particle(i).Position;
            particle(i).Best.Cost=particle(i).Cost;         
            % Update Global Best
            if particle(i).Best.Cost<BestSol.Cost              
                BestSol=particle(i).Best;               
            end          
        end       
    end    
    BestCost(it)=BestSol.Cost;
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);   
    w=w*wdamp;      
    Show(BestSol.Position,Model,Degree);
    pause(0.5);
end
disp('End of PSO.');