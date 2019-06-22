#!/bin/sh

make squeaky
make app
make clean

if [ -f "app" ] ; then
   echo "build success"
   exit 0
else
   echo "build failed"
   exit 1
fi
