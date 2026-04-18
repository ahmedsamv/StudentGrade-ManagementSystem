#! /usr/bin/bash

function subject_statistics(){

read -p "enter subject code: " subjcode

file="../grade_managment/grades/$subjcode.grd"

if [ ! -f "$file" ]; then
echo "subject not found"
return
fi 


awk -F'|' '
{

sum += $2
if (NR == 1 || $2 > max) max = $2
if (NR == 1 || $2 < min) min = $2
}
END {
if (NR >0){
print "Average = " sum/NR
print "Max = " max
print "Min = " min
}else {
print "no data"
}
}
' "$file"
}

subject_statistics
