#!/bin/bash

declare -A url
url=( ['someonewhocares.dl']=http://someonewhocares.org/hosts/zero/hosts \
	['yoyo.dl']=http://pgl.yoyo.org/as/serverlist.php?mimetype=plaintext \
	['kadhosts.dl']=https://raw.githubusercontent.com/azet12/KADhosts/master/KADhosts.txt \
	['badd_boyz.dl']=https://raw.githubusercontent.com/mitchellkrogza/Badd-Boyz-Hosts/master/hosts \
	['sbc.dl']=http://sbc.io/hosts/hosts \
	)

dlfile=$(mktemp)
tmp1=$(mktemp)
tmp2=$(mktemp)

curl ${url[$1]} > $dlfile

case $1 in
	'someonewhocares.dl')
		sed '/#.*<localhost>/,/#.*<\/localhost>/d' < $dlfile | sed 's/#0.0.0.0/0.0.0.0/' | sed 's/#.*$//' | sed 's/^0.0.0.0 //' | sed 's/\s//g' | sed '/^$/d' | sort | uniq > $tmp1
		;;
	'yoyo.dl')
		sed '/^#/d' < $dlfile | sed 's/^127.0.0.1 //' > $tmp1
		;;
	'badd_boyz.dl')
		sed -n 's/^0.0.0.0\s*//p' < $dlfile > $tmp1
		;;
	'kadhosts.dl')
		sed -n 's/^0.0.0.0\s*//p' < $dlfile | tr -d '\r' > $tmp1
		;;
	'sbc.dl')
		sed -n 's/^0.0.0.0\s*//p' < $dlfile | sed '/^0.0.0.0$/d' >  $tmp1
		;;
esac

out=$1

[[ -f $out ]] || touch $out

cat $tmp1 > $tmp2

[[ -f $out ]] && cat $tmp1 $out | sort | uniq > $tmp2

[[ 0 -eq $(diff $tmp2 $out | wc -l) ]] || cp $tmp2 $out

rm $tmp1 $tmp2 $dlfile

