#!/bin/sh

set -e

git co other.h hello.h
rm -f newname.h
make clean
echo "CLEAN BUILD (exe gets built):"
set -x
make
./exe
set +x

sleep 1
echo
echo "RENAME other.h -> newname.h (rebuilt CORRECTLY)"
set -x
mv other.h newname.h
perl -pi -e 's/other.h/newname.h/;' hello.h
make
./exe
set +x

sleep 1
echo
echo "REMOVE newname.h (gcc CORRECT ERROR)"
set -x
rm newname.h
make
./exe
set +x
