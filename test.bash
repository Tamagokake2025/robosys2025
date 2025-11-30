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
out=$(echo "a d y " | $prog)
[ "${out}" = "1 4 25" ] || ng "$LINENO"

out=$(echo "apple kei" | $prog)
[ "${out}" = "1 16 16 12  11 5 9" ] || ng "$LINENO"

out=$(echo "7 19 26" | $prog)
[ "${out}" = "g s z" ] || ng "$LINENO"

out=$(echo @ / . = | $prog)
[ "${out}" = "? ? ? ?" ] || ng "$LINENO"

out=$(echo "27 32 43 57" | $prog)
[ "${out}" = "? ? ? ?" ] || ng "$LINENO"

### 結果 ###
[ "$res" = 0 ] && echo OK
exit $res

