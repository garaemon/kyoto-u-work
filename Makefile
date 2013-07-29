all: one.out two.out

%.out: %.f90
	gfortran -g $< -o $@
clean:
	rm -rf *.out
