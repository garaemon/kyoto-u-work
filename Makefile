all: one.out

%.out: %.f90
	gfortran $< -o $@
clean:
	rm -rf *.out
