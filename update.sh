#!/bin/sh

cd files
make update
git commit -a -m "automatic update @ $(date)"
git push

