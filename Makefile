all: one.out two.out three.out

%.out: %.f90
	gfortran -g $< -o $@
clean:
	rm -rf *.out
