function []=Show(Input,Model,Degree)
clf();
plot([Model.x],[Model.y],'*');
hold on;
x=linspace(min(Model.x),max(Model.x),100);
y=zeros(1,length(x));
for i=1:length(x)
    if(Degree==1)
        y(i)=(Input(1)*x(i)+Input(3))/(-Input(2));
    elseif(Degree==2)
        y(i)=(Input(1)*x(i)^2+Input(2)*x(i)+Input(4))/(-Input(3));
    elseif(Degree==3)
        y(i)=(Input(1)*x(i)^3+Input(2)*x(i)^2+Input(3)*x(i)+Input(5))/(-Input(4));
    end
end
plot(x,y);
end