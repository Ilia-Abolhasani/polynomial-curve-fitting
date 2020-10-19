clc;clear;close all;
c=[3,-2.23,-5.1,9.8];
x=-3:0.1:3;
y=polyval(c,x)
for i=1:length(y)
    y(i)=y(i)+((rand()-0.5)*10);
end


%%
Model.x=x;
Model.y=y;
clearvars -except Model
save('./Model.mat')
plot([Model.x],[Model.y],'.')