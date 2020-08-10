             MODULE gnuplot
             CONTAINS
  
             SUBROUTINE draw_pendulum(x1,x2,y1,y2,l1,l2,t,k)

             IMPLICIT NONE
             REAL*8 , INTENT(IN)   :: x1, x2, y1, y2, l1, l2, t                    !variáveis do programa: posições x e y, comprimento da haste e tempo 
             INTEGER, INTENT(IN)   :: k                                            !passo presente da dinâmica 
             REAL*8                :: l                                            !tamanho do quadro da imagem
             CHARACTER(LEN=16)     :: fname1                                       !variável de nome dinâmico pend.....
             CHARACTER(LEN=6)      :: string1                                      !variável de nome dinâmico pend.....
             CHARACTER(LEN=16)     :: fname2                                       !variável de nome dinâmico para o tempo
             CHARACTER(LEN=10)     :: string2                                     !variável de nome dinâmico para o tempo



      l = l1 + l2 + 1.d0

      WRITE(string1,'(i6.6)') k                                                    !gera a parte númerica do nome do arquivode saída pend.....png
              fname1 = 'pend'//string1//'.png'                                       !gera o nome da imagem .png
      
      WRITE(string2,'(F10.6)') t                                        
              fname2 = string2                                                       !gera o tempo dinâmica que aparece nas imagens
        

      OPEN (20,FILE = "script_pendulum.gnu")                                        !gera o arquivo para o script do gnuplot
      
      WRITE(20,FMT = '(a)') 'reset'                                                   !reseta as configurações preexistente no terminal do gnuplot 
      
      WRITE(20,FMT = '(a)') "set terminal pngcairo dashed size 700,700 enhanced font 'Verdana,20'"                                      !configura o terminal do gnuplot para criar imagens png
 
      WRITE(20,FMT='(a , a , a)')    "set output '",fname1,"'"                        !gera o nome dos arquivos de saída

      WRITE(20,FMT = '(a)') ''                                                        !insere linha em branco (serve somente para estética e oganização do script)

      WRITE(20,FMT = '(a)') 'unset key'                                               !desabilita o nome das linhas 

      WRITE(20,FMT='(a , a , a)')    "set title ' Tempo = ",fname2," s'"              !gera o tempo dinâmica que aparece nas imagens

      WRITE(20,FMT = '(a)') '' 

      WRITE(20,FMT = '(a)') ' set format x'' '                                        !retira os números presentes no eixo x
 
      WRITE(20,FMT = '(a)') ' set format y'' '                                        !retira os números presentes no eixo y

      WRITE(20,FMT = '(a)') '' 
 
      WRITE(20,FMT = '(a)') 'set size ratio -1'                                       !enquandramento para uma imagem quadrada exp 700x700

      WRITE(20,FMT = '(a)') 'set style fill solid 1.0 border -1'                      !habilitar preencimhento da bolinha

      WRITE(20,FMT = '(a)') '' 


      WRITE(20,FMT = '(a,F4.2,a,F4.2,a)') 'set xrange[-',l,':',l,']'                  !tamanho do quadro na direção x 
      WRITE(20,FMT = '(a,F4.2,a,F4.2,a)') 'set yrange[-',l,':',l,']'                  !tamanho do quadro na direção y 


      WRITE(20,FMT = '(a)') '' 


      WRITE(20,FMT = '(a,F12.5,a,F12.5,a)') 'set arrow 1 from 0.0 , 0.0 to ', x1 ,',', y1 ,' nohead front lw 2'                                       !gera a haste da bolinha 1
      
      WRITE(20,FMT = '(a,F12.5,a,F12.5,a,F12.5,a,F12.5,a)') 'set arrow 2 from ', x1 ,',', y1 ,' to ', x2 ,',', y2 ,' nohead front lw 2'                !gera a haste da bolinha 2
      
      WRITE(20,FMT = '(a,F4.2,a,F4.2,a)') 'set arrow 3 from -',l,' , 0.0 to ', l ,',0.0 nohead front lw 2'                                             !gera a base do pêndulo
     

      WRITE(20,FMT = '(a)') '' 


!c      WRITE(20,FMT = '(a,F12.5,a,F12.5,a)') 'set object 1  circle center
!c     $ ', x1 ,',', y1 ,' size 0.1 fs empty border rgb "black"
!c     $  front lw 3'
!
!c      WRITE(20,FMT = '(a,F12.5,a,F12.5,a)') 'set object 2  circle center
!c     $ ', x2 ,',', y2 ,' size 0.1 fs empty border rgb "black"
!c     $  front lw 3'

      WRITE(20,FMT = '(a,F12.5,a,F12.5,a)') 'set object 1  circle center ', x1 ,',', y1 ,' size 0.1 fc rgb "black" front lw 3'                        !gera a bolinha 1

      WRITE(20,FMT = '(a,F12.5,a,F12.5,a)') 'set object 2  circle center ', x2 ,',', y2 ,' size 0.1 fc rgb "black" front lw 3'                        !gera a bolinha 2



      WRITE(20,FMT = '(a)') ' '


      WRITE(20,FMT = '(a)') 'plot NaN'                                              !plota a imagem
      WRITE(20,FMT = '(a)') 'reset'

      WRITE(20,FMT = '(a)') '' 
      WRITE(20,FMT = '(a)') '' 




             END SUBROUTINE draw_pendulum 
             
            END MODULE gnuplot
