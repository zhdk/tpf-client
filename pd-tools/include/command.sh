#!/bin/bash
while read line
do
    echo "$line"
done < <($@ 2>&1  & echo "PID $!")
