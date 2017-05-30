#!/bin/sh

file=version

subver=$(echo 1+$(sed 's/[[:digit:]]*\.//' < $file ) | bc)
ver=$(sed 's/\([[:digit:]]*\)\..*/\1/' < $file)

echo $ver.$subver > $file
