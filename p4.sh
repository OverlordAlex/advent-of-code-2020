#!/usr/bin/env bash

# this solution returns 102 instead of 101. Dunno which regex is wrong ¯\_(ツ)_/¯

passport=""
valid=0

while read line; do
    if [[ ! -z "$line" ]]; then
        passport="$passport $line"
    else
        if [[ 
                "$passport" =~ byr:((19[2-9][0-9])|(200[0-2])) && 
                "$passport" =~ iyr:20((1[0-9])|(20)) && 
                "$passport" =~ eyr:20((2[0-9])|(30)) && 
                "$passport" =~ hgt:((1(([5-8][0-9])|(9[0-3]))cm)|(((59|(6[0-9])|(7[0-6]))in))) && 
                "$passport" =~ hcl:#(([0-9])|([a-f])){6} && 
                "$passport" =~ ecl:(amb|blu|brn|gry|grn|hzl|oth) && 
                "$passport" =~ pid:[0-9]{9}
            ]]; then
            valid=$(($valid + 1))
        fi
        passport=""
    fi
done <in.4

echo $valid
