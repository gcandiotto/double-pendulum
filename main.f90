        PROGRAM nonlinear_2D_system

        USE model_parameters
        USE dynamics
        USE gnuplot
             
        IMPLICIT NONE

        !!!!!!!!!!!!!! LOCAL VARIABLES !!!!!!!!!!!!!!!!!!!!!

        REAL*8  :: vec(4) , work(10000)
        REAL*8  :: t , t_rate , tout 
        INTEGER :: k , iflag , iwork(10)
        REAL*8  :: x1 , x2 , y1 , y2
            
        !!!!!!!!!!!!!!! LOCAL PARAMETERS !!!!!!!!!!!!!!!!!!!
            
        REAL*8 , PARAMETER :: relerr = 1.d-12
        REAL*8 , PARAMETER :: abserr = 1.d-12

        OPEN(UNIT=9  ,FILE='x1.dat'   ,STATUS='unknown')
        OPEN(UNIT=10 ,FILE='x2.dat'   ,STATUS='unknown')
        OPEN(UNIT=11 ,FILE='x1y1.dat' ,STATUS='unknown')
        OPEN(UNIT=12 ,FILE='y1.dat'   ,STATUS='unknown')
        OPEN(UNIT=13 ,FILE='y2.dat'   ,STATUS='unknown')
        OPEN(UNIT=14 ,FILE='x2y2.dat' ,STATUS='unknown')


        !!!!!!!!!!!!! INITIAL CONDITIONS !!!!!!!!!!!!!!!1

        vec(1) = 0.d0   ! <== momento 1
        vec(2) = 0.d0   ! <== momento 2inicial
        vec(3) = -3.14  ! theta 1
        vec(4) = -3.14  ! theta 2

        iflag = 1

        t_rate = (t_f - t_i) / float(npt)

        t = t_i

        DO k = 1 , npt

                tout = t + t_rate
       
                CALL ode( usrfun , neqn , vec , t , tout , relerr , abserr , iflag , work , iwork )

                IF( iflag .NE. 2 )  WRITE(*,*) 'iflag = ', iflag ,' tout = ', tout

               iflag = 1
               x1 = l1*sin(vec(3))
               y1 = l1* cos(vec(3))
               x2 = x1 + l2*sin(vec(4))
               y2 = y1+ l2*cos(vec(4))


               WRITE(9,10) t , x1
               WRITE(10,10) t, x2
               WRITE(11,10) x1, y1
               WRITE(12,10) t , y1
               WRITE(13,10) t , y2
               WRITE(14,10) x2 , y2

               CALL draw_pendulum(x1,x2,y1,y2,l1,l2,t,k)

        END DO

        CLOSE(9)
        CLOSE(10)
        CLOSE(11)

10      FORMAT(F12.5,5x,3F10.5) 


        END PROGRAM
        
