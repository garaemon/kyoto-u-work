all: one
one: one.f90
	gfortran $< -o $@
clean:
	rm -rf one
