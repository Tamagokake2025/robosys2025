#!/usr/bin/bash

ng () {
	echo ${1}行目が${2}よ
	res=1
}
res=0
a=山田
[ "$a" = 上田 ] || ng "$LINENO" 違う
[ "$a" = 山田 ] || ng "$LINENO" 正しい

exit $res
