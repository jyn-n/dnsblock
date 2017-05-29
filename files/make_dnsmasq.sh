#!/bin/sh

in=$2
out=$1

sed 's/\(.*\)/address=\/\1\/0.0.0.0/' < $in > $out
