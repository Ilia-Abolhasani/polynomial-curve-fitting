function MSE=Fitness(Input,Model,Degree)
x=Model.x;
y=Model.y;
%%
Error=0;
if(Degree ==1)
    for i=1:length(x)
        a=Input(1);
        b=Input(2);
        c=Input(3);
        OutY=(a*x(i)+c)/-b;
        Distance=OutY-y(i);
        Error=Error+(Distance)^2;
    end
elseif(Degree==2)
    for i=1:length(x)
        a=Input(1);
        b=Input(2);
        c=Input(3);
        d=Input(4);
        OutY=(a*(x(i)^2)+b*x(i)+d)/-c;
        Distance=OutY-y(i);
        Error=Error+(Distance)^2;
    end
elseif(Degree==3)
    for i=1:length(x)
        a=Input(1);
        b=Input(2);
        c=Input(3);
        d=Input(4);
        e=Input(5);
        OutY=(a*(x(i)^3)+b*(x(i)^2)+c*x(i)+e)/-d;
        Distance=OutY-y(i);
        Error=Error+(Distance)^2;
    end
end
MSE=Error/length(x);
end