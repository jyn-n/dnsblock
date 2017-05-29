#!/bin/sh

url=http://someonewhocares.org/hosts/zero/hosts
[[ -z $2 ]] || url=$2

tmpfile=$(mktemp)

curl $url > $tmpfile

out=$1

[[ -f $out ]] || touch $out
[[ 0 -eq $(diff $tmpfile $out | wc -l) ]] || cp $tmpfile $out

rm $tmpfile

