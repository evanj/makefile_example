#!/bin/sh

set -e

rm -f exe
git co exe.c hello.h
echo "CLEAN BUILD (exe gets built):"
set -x
make
./exe
set +x

echo
echo "REBUILD with nothing updated (nothing gets built):"
set -x
make
set +x

sleep 1  # Mac OS X HFS+ timestamps have 1s resolution
echo
echo "UPDATE exe.c (rebuilt and prints GOODBYE):"
set -x
perl -pi -e 's/hello from/GOODBYE from/;' exe.c
make
./exe
set +x

sleep 1  # Mac OS X HFS+ timestamps have 1s resolution
echo
echo "UPDATE hello.h (NOT rebuilt; prints the WRONG output):"
set -x
perl -pi -e 's/says hello/says GOODBYE/;' hello.h
make
./exe
set +x

echo
echo "CORRECT output after manual rebuild:"
set -x
rm exe
make
./exe
set +x
