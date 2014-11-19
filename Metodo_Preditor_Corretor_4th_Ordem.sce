clear

//Metodo Runge - Kutta de 4 ordem
function result = RK4(x,y,hR,F_xy)
    for i=1:(length(x)-1)                              // calculation loop
        k_1 = F_xy(x(i),y(i));
        k_2 = F_xy(x(i)+0.5*hR,y(i)+0.5*hR*k_1);
        k_3 = F_xy((x(i)+0.5*hR),(y(i)+0.5*hR*k_2));
        k_4 = F_xy((x(i)+hR),(y(i)+k_3*hR));
    
        y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*hR;  // main equation
    end
    result=y;
endfunction

//Initialize the method
//iniInterval=0;
//endInterval=2;
//h=0.2             //(endInterval-iniInterval)/numSubInterval    //Step size
//numSubInterval=(endInterval-iniInterval)/h                                      //Number of steps of ABM4


iniInterval=0;
endInterval=1;
numSubInterval=10                                       //Number of steps of ABM4
h=((endInterval-iniInterval)/numSubInterval);    //Step size


//Method Runge Kutta 4th Order
xRK = iniInterval:h:iniInterval+3*h;                  // Calculates x for Range Kutta
yRK = zeros(1,length(xRK));                            // Make a array of zeros who size is lenght(x) 
//yRK(1)=0.5
yRK(1) = 1;                                          //Initial condition

//t=x  e r=y
function result = F_xy(t,r)
    //result = r-(t^2)+1;                    //Change the function as you desire
    result=t-2*r+1;
endfunction

yRK=RK4(xRK,yRK,h,F_xy)                              //Range Kutta 4th order  
 
//Method Adams-Bashfort-Moulton 4th Order
f = zeros(1,5);
xABM=zeros(1,numSubInterval+1);
yABM=zeros(1,numSubInterval+1);
for i=1:4
    xABM(i)=xRK(i);
    yABM(i)=yRK(i);
    disp("x= "+string(xABM(i))+" y= "+string(yABM(i)));
end   
for i=4:numSubInterval
    for k=3:-1:0 //Initialize the function 
        x=xABM(i-k);
        y=yABM(i-k);
        f(3-k+1)=F_xy(x,y); //f1,f2,f3,f4
    end
    //Predition
    Ypre =yABM(i)+((1/24)*h*((55*f(4))-(59*f(3))+(37*f(2))-(9*f(1))));
    
    yABM(i+1)=Ypre;
    xABM(i+1)=iniInterval+i*h;
    
    //Correction   
    x=xABM(i+1);
    y=yABM(i+1);
    f(5)=F_xy(x,y);
    Ycor=yABM(i)+((1/24)*h*(9*f(5)+19*f(4)-5*f(3)+f(2)));
    yABM(i+1)=Ycor;
        
    disp("x= "+string(xABM(i+1))+" y= "+string(yABM(i+1)));  
  
end
