//Initial Condition
g=9.8
l1=10
l2=10
m1=1
m2=1
teta1=1
teta2=0
dteta1=1
dteta2=0

M=4

a=1
b=10
N=10
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
        k(1)(j)=h*func(w(1),w(2),w(3),w(4))
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
        k(4,j)=h*func(w(1)+(k(4,1)/2),w(2)+(k(4,2)/2),w(3)+(k(4,3)/2),w(4)+(k(4,4)/2))
    end

    for j =1:M
        w(j+1)=w(j)+(k(1,j)+k(2,j)+k(3,j)+k(4,j))/6
    end

    disp(w)
end
