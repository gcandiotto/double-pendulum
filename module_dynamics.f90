        MODULE dynamics

                USE model_parameters 

                CONTAINS

                SUBROUTINE  usrfun(t,x,xp)
         
                IMPLICIT NONE

                REAL*8  ,INTENT(IN)    :: t 
                REAL*8  ,INTENT(IN)    :: x(neqn)
                REAL*8  ,INTENT(INOUT) :: xp(neqn)

                !!!!!!!!!!!!!! DYNAMICS EQUATIONS !!!!!!!!!!!!!!!!

                xp(1) =-(((2.*l1*l2*m2*x(1)*x(2)*sin(x(3)-x(4))*l1**2.*l2**2.*m2*(2.*m1+m2-m2*cos(2.*(x(3)-x(4))))-(l2**2.*m2*x(1)**2.+l1**2.*(m1+m2)*x(2)**2-2*l1*l2*m2*x(1)*x(2)*cos(x(3)-x(4)))*l1**2.*l2**2.*m2**2.*2.*sin(2.*(x(3)-x(4))))/(l1**2.*l2**2.*m2*(2.*m1+m2-m2*cos(2.*(x(3)-x(4)))))**2.)+g*m1*l1*sin(x(3)) + g*m2*l1*sin(x(3)))


                xp(2) =-(((-2.*l1*l2*m2*x(1)*x(2)*sin(x(3)-x(4))*l1**2.*l2**2.*m2*(2.*m1+m2-m2*cos(2.*(x(3)-x(4))))-(l2**2.*m2*x(1)**2.+l1**2.*(m1+m2)*x(2)**2.-2.*l1*l2*m2*x(1)*x(2)*cos(x(3)-x(4)))*l1**2.*l2**2.*m2**2.*2.*sin(2.*(x(3)-x(4))))/(l1**2.*l2**2.*m2*(2.*m1+m2-m2*cos(2.*(x(3)-x(4))))**2.)) + g*m2*l2*sin(x(4)))           

                xp(3) = (2.*l2*m2*x(1) - 2.*l1*l2*m2*x(2)*cos(x(3) - x(4)))/(l1**2.*l2**2.*m2*(2.*m1+m2-m2*cos(2.*(x(3)-x(4)))))

                xp(4) = (2.*l1**2.*(m1+m2)*x(2) - 2.*m2*l1*l2*x(1)*cos(x(3)-x(4)))/(l1**2.*l2**2.*m2*(2.*m1+m2-m2*cos(2.*(x(3)-x(4)))))


                END SUBROUTINE usrfun

        END MODULE dynamics 

