#!/bin/sh

make squeaky
make app
make clean 

if [ -f "app" ] ; then
   echo "lint success"
   exit 0
else
   echo "lint failed"
   exit 1
fi
