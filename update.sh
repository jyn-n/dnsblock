#!/bin/sh

cd files
make fetch_lists
make -q && exit(0)
make
cd ..
git commit -a -m "automatic update @ $(date)"
git push

