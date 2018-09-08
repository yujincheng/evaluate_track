#!/bin/bash
PWD=$1
FIRSTLINE=$(sed -n 1p ./$PWD/first.txt)
OFFSETVALUE=${FIRSTLINE%% *}
python associate.py --offset $OFFSETVALUE  --first --max_difference 0.0042 ./$PWD/first.txt ./$PWD/second.txt > ./$PWD/first_result.txt
python associate.py --offset $OFFSETVALUE --max_difference 0.0042 ./$PWD/first.txt ./$PWD/second.txt > ./$PWD/second_result.txt
python evaluate_ate.py --scale 0.5 --plot ./$PWD/1.png  ./$PWD/second_result.txt ./$PWD/first_result.txt

