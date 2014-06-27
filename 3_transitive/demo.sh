#!/bin/sh

set -e

git co other.h hello.h
make clean
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
echo "UPDATE hello.h to include other.h (IS rebuilt; prints the CORRRECT output):"
set -x
cp hello2.h hello.h
make
./exe
set +x


sleep 1  # Mac OS X HFS+ timestamps have 1s resolution
echo
echo "UPDATE other.h (rebuilt and prints UPDATED):"
set -x
perl -pi -e 's/"printOther()/"printOther() UPDATED/;' other.h
make
./exe
set +x

sleep 1
echo
echo "RENAME other.h -> newname.h (make has an ERROR)"
set -x
mv other.h newname.h
perl -pi -e 's/other.h/newname.h/;' hello.h
make
set +x
