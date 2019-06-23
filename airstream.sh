#!/bin/sh

CONTAINERS="lint build unit_test"

for f in $CONTAINERS; do
  ( echo $f ; \
    cd "containers/$f" ; \
    docker-compose up --build )
done
