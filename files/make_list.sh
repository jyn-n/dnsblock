#!/bin/sh

tmp1=$(mktemp)
tmp2=$(mktemp)
out=$1
in=$2

cat $in | sed '/#.*<localhost>/,/#.*<\/localhost>/d' | sed 's/#0.0.0.0/0.0.0.0/' | sed 's/#.*$//' | sed 's/^0.0.0.0 //' | sed 's/\s//g' | sed '/^$/d' | sort | uniq > $tmp1

cat $tmp1 > $tmp2

[[ -f $out ]] && cat $tmp1 $out | sort | uniq > $tmp2


[[ -f $out ]] || touch $out
[[ 0 -eq $(diff $tmp2 $out | wc -l) ]] || cp $tmp2 $out

rm $tmp1 $tmp2

