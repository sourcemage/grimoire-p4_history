# they should not redefine behavior of a standard variable
find -name makefile | while read path; do
  sedit 's|CFLAGS|COMPILE_FLAGS|g' $path
done &&
source build -r linux-nox &&
make
