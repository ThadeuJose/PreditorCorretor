funcprot(0)//Alter the protection level of the function to unprotected

//Define the functions f1,f2,f3,f4 to be able to put in the list

deff('fun1 = f1(u1,u2,u3,u4)', 'fun1=u2')

deff('fun2 = f2(u1,u2,u3,u4)', 'fun2=(((-g)*(2*m1+m2)*sin(u1))-(m2*g*sin(u1-(2*u3)))-(2*sin(u1-u3)*m2*(((u4^2)*l2)+(((u2^2)*l1)*cos(u1-u3)))))/(l1*(2*m1+m2-(m2*cos((2*u1)-(2*u3)))))')

deff('fun3 = f3(u1,u2,u3,u4)', 'fun3=u4')

deff('fun4 = f4(u1,u2,u3,u4)', 'fun4=(2*sin(u1-u3)*(((u2^2)*l1*(m1+m2))+(g*(m1+m2)*cos(u1))+((u4^2)*l2*m2*cos(u1-u3))))/(l2*((2*m1)+m2-(m2*cos((2*u1)-(2*u3)))))')
