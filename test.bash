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
out=$(echo "a b c" | $prog)
[ "${out}" = "1 2 3" ] || ng "$LINENO"

out=$(echo "abc" | $prog)
[ "${out}" = "1 2 3" ] || ng "$LINENO"

out=$(echo "1 2 26" | $prog)
[ "${out}" = "a b z" ] || ng "$LINENO"

out=$(echo @ | $prog)
[ "${out}" = "?" ] || ng "$LINENO"

out=$(echo "27 33" | $prog)
[ "${out}" = "? ?" ] || ng "$LINENO"

### 結果 ###
[ "$res" = 0 ] && echo OK
exit $res

