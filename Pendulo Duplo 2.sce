clear

funcprot(0)//Alter the protection level of the function to unprotected

//Define the functions f1,f2,f3,f4 to be able to put in the list

deff('fun1 = f1(u1,u2,u3,u4)', 'fun1=u2')

deff('fun2 = f2(u1,u2,u3,u4)', 'fun2=(((-g)*(2*m1+m2)*sin(u1))-(m2*g*sin(u1-(2*u2)))-(2*sin(u1-u3)*m2*((u4^2)+((u2^2)*cos(u1-u3)))))/(l1*(2*m1+m2-(m2*cos((2*u1)-(2*u3)))))')

deff('fun3 = f3(u1,u2,u3,u4)', 'fun3=u4')

deff('fun4 = f4(u1,u2,u3,u4)', 'fun4=(2*sin(u1-u3)*(((u2^2)*l1*(m1+m2))+(g*(m1+m2)*cos(u1))+((u4^2)*l2*m2*cos(u1-u3))))/(l2*((2*m1)+m2-(m2*cos((2*u1)-(2*u3)))))')

//Initial Condition
g=9.81
l1=1
l2=1
m1=0.5
m2=0.5
//Radians
teta1=%pi/2
teta2=0
dteta1=0
dteta2=0

M=4 //Number of Equations

a=0
b=100
N=10000
h=(b-a)/N

u1=teta1
u2=dteta1
u3=teta2
u4=dteta2

w=zeros(N)
w(1)=u1
w(2)=u2
w(3)=u3
w(4)=u4

disp(w)

k=zeros(4,M)

f=list(f1,f2,f3,f4)

for i=1:N
    
    for j =1:M
        func=f(j)
        k(1,j)=h*func(w(1),w(2),w(3),w(4))
    end

    for j =1:M
        func=f(j)
        k(2,j)=h*func(w(1)+(k(1,1)/2),w(2)+(k(1,2)/2),w(3)+(k(1,3)/2),w(4)+(k(1,4)/2))
    end
    
    for j =1:M
        func=f(j)
        k(3,j)=h*func(w(1)+(k(2,1)/2),w(2)+(k(2,2)/2),w(3)+(k(2,3)/2),w(4)+(k(2,4)/2))
    end
    
    for j =1:M
        func=f(j)
        k(4,j)=h*func(w(1)+(k(3,1)/2),w(2)+(k(3,2)/2),w(3)+(k(3,3)/2),w(4)+(k(3,4)/2))
    end

    for j =1:M
        w(j+1)=w(j)+(k(1,j)+2*k(2,j)+2*k(3,j)+k(4,j))/6
    end

    disp(w)
end
