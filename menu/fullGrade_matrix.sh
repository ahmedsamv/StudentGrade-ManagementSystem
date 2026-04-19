#! /usr/bin/bash 

function fullGrade_matrix(){


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
    
    
