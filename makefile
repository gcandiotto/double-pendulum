#

.SUFFIXES: .f90

FC=/opt/intel/bin/ifort

FFLAGS = -qopenmp -xhost -static -heap-arrays  

LIB_BLAS   = -L/opt/intel/mkl/lib/intel64 -lmkl_blas95_lp64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread
LIB_LAPACK = -L/opt/intel/mkl/lib/intel64 -lmkl_lapack95_lp64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread

INCS_MKL   = -I/opt/intel/mkl/include/intel64/lp64

LIB  = $(LIB_BLAS) $(LIB_LAPACK)
INCS = $(INCS_MKL)

#-----------------------------------------------------------------------
# general rules
#-----------------------------------------------------------------------

SOURCE = module_parameters.o\
         module_ode.o\
         module_dynamics.o\
         module_gnuplot.o\
         main.o\


a: $(SOURCE)  
	-rm -f a
	$(FC) $(INCS) -o a $(SOURCE) $(LIB) 
	-rm -f *.log
.f.o:
	$(FC) $(FFLAGS) $(INCS) -c $<
.f90.o:
	$(FC) $(FFLAGS) $(INCS) -c $<
clean: 
	-rm -f *.o *.mod; touch *.f *.f90
