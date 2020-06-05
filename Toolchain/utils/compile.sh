#!/usr/bin/env bash

PROJECT=$1

LD=$2
LD_FLAGS=$3
LD_FILE=$4

OUTPUT=$5

$LD $LD_FLAGS -T $LD_FILE $(find -name '*.o' | tr '\n' ' ') -o $OUTPUT

if [ -f $OUTPUT ]; then
    echo "\e[92mBuild $PROJECT with successfully! \e[0m"
else
    echo "\e[91m** ERROR ** An error occurred during the compilation of the $PROJECT! \e[0m"
    exit 1
fi