//Initialize the method

//iniInterval=1;
//endInterval=10;
//numSubInterval=10                                       //Number of steps of ABM4
//h=0.01;//((endInterval-iniInterval)/numSubInterval);    //Step size

iniInterval=0;
endInterval=1;
numSubInterval=10                                       //Number of steps of ABM4
h=0.1;//((endInterval-iniInterval)/numSubInterval);    //Step size

//Method Runge Kutta 4th Order
xRK = iniInterval:h:iniInterval+3*h;                  // Calculates x for Range Kutta
yRK = zeros(1,length(xRK));                            // Make a array of zeros who size is lenght(x) 
yRK(1)=1
//yRK(1) = 5;                                          //Initial condition

function result = F_xy(t,r)
    //result = (r*r-r)/t;                    //Change the function as you desire
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
    disp(yABM(i),xABM(i));
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
    f(4)=F_xy(x,y);
    Ycor=yABM(i)+((1/24)*h*(9*f(5)+19*f(4)-5*f(3)+f(2)));
    
    disp(yABM(i+1),xABM(i+1));    
end
