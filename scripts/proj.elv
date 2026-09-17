#!/usr/bin/env elvish

if (== 0 (count $args)) {
    echo 'needs name'
    exit 1
}

var x = $args[0]

var target = (zoxide query $x)

cd $target

echo "here"

code .

exit 0
exit 0
