#!/bin/sh

make squeaky
make app
make clean 

./app > output.2
RESULT=$(diff output.1 output.2)

if [ -z "$RESULT" ] ; then
   echo "unit test success"
   exit 0
else
   echo "unit test failed"
   exit 1
fi
