#! /usr/bin/bash


function top_student() {

 for stu in ../sgms_data/students/*.stu; do

        sid=$(sed -n '1p' "$stu")
        name=$(sed -n '2p' "$stu")

        total=0
        count=0

        for file in ../grade_managment/grades/*.grd; do

            line=$(grep "^$sid|" "$file")

            if [ ! -z "$line" ]; then

                grade=$(echo "$line" | cut -d'|' -f3)

                if [ "$grade" = "A" ] || [ "$grade" = "A+" ]; then
                    gp=4
                      elif [ "$grade" = "A-" ]; then
                    gp=3.7
                      elif [ "$grade" = "B+" ]; then
                    gp=3.3
                elif [ "$grade" = "B" ]; then
                    gp=3
                      elif [ "$grade" = "B-" ]; then
                    gp=2.7
                      elif [ "$grade" = "C+" ]; then
                    gp=2.3
                elif [ "$grade" = "C" ]; then
                    gp=2
                      elif [ "$grade" = "C-" ]; then
                    gp=1.7
                elif [ "$grade" = "D" ]; then
                    gp=1
                else
                    gp=0
                fi

                total=$(echo "$total + $gp" | bc)
                count=$((count + 1))
            fi
        done

        if [[ $count > 0 ]]; then
        gpa=$(echo "scale=2; $total / $count" | bc)
            echo "$name $gpa"
        fi
    done | sort -k2 -nr

}


top_student


