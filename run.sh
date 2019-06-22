#!/bin/sh

for f in "lint" "build" "unit_test"; do
  echo $f
  ( cd "containers/$f" ; docker-compose up --build )
done
