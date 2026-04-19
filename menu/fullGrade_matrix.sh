#! /usr/bin/bash 

function fullGrade_matrix(){

if [[ ! -d "../sgms_data/students" || -z "$(ls "../sgms_data/students")" ]]; then
        echo "No students found"
        return
    fi


    if [[ ! -d "../sgms_data/grades" || -z "$(ls "../sgms_data/grades")" ]]; then
        echo "No grades found"
        return
    fi


    echo "----- Full Grade Matrix -----"

    for stu in "../sgms_data/students"/*.stu
    do
        sid=$(sed -n '1p' "$stu")
        name=$(sed -n '2p' "$stu")

        echo "Student: $name"

        for grd in "../sgms_data/grades"/*.grd
        do
            code=$(basename "$grd" .grd)
            line=$(grep "^$sid|" "$grd")

            if [[ -n "$line" ]]
            then
                score=$(echo "$line" | cut -d'|' -f2)
                grade=$(echo "$line" | cut -d'|' -f3)
                echo "  $code | $score | $grade"
            fi
        done
    done
    
    }
    
    
