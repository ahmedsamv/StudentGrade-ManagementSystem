#! /usr/bin/bash

function subject_statistics(){

   read -p "Enter subject code: " subjcode

    file="../sgms_data/subjects/$subjcode.sub"

    if [[ ! -f "$file" ]]; then
        echo "Subject not found"
        return
    fi

    name=$(sed -n '2p' "$file")
    credits=$(sed -n '3p' "$file")

    echo "----- Subject Info -----"
    echo "Code: $subjcode"
    echo "Name: $name"
    echo "Credits: $credits"

    grd_file="../sgms_data/grades/$subjcode.grd"

    if [[ ! -f "$grd_file" ]]; then
        echo "No grades recorded for this subject"
        return
    fi

    echo ""
    echo "----- Statistics -----"
    
    
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
' "$grd_file"
}

subject_statistics
