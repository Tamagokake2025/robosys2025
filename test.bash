#!/usr/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Keitaro Takeda
# SPDX-License-Identifier: BSD-3-Clause

#!/bin/bash

ng() {
    echo "${1}行目が違うよ"
    res=1
}

res=0
prog="./alnum"

### Normal Input ###
out=$(echo "c d y " | $prog)
[ "${out}" = "3 4 25" ] || ng "$LINENO"

out=$(echo "apple kei" | $prog)
[ "${out}" = "1 16 16 12 5 11 5 9" ] || ng "$LINENO"

out=$(echo "7 19 26" | $prog)
[ "${out}" = "g s z" ] || ng "$LINENO"

out=$(echo "ro 8 20 qju" | $prog)
[ "${out}" = "18 15 h t 17 10 21" ] || ng "$LINENO"

out=$(echo @ / . = | $prog)
[ "${out}" = "? ? ? ?" ] || ng "$LINENO"

out=$(echo "27 32 43 57" | $prog)
[ "${out}" = "? ? ? ?" ] || ng "$LINENO"

out=$(echo "こんにちは" | $prog)
[ "${out}" = "12371 12435 12395 12385 12399" ] || ng "$LINENO"

out=$(echo "! 12371 12435 12395 12385 12399" | $prog)
[ "${out}" = "!こんにちは" ] || ng "$LINENO"

out=$(echo "! 73 1 13 fine" | $prog)
[ "${out}" = "!Iamfine" ] || ng "$LINENO"

### 結果 ###
[ "$res" = 0 ] && echo OK
exit $res

