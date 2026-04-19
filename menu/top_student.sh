#! /usr/bin/bash


function top_student() {

if [[ ! -d "../sgms_data/students" || -z "$(ls "../sgms_data/students")" ]]; then
        echo "No students found"
        return
    fi


    if [[ ! -d "../sgms_data/grades" || -z "$(ls "../sgms_data/grades")" ]]; then
        echo "No grades found"
        return
    fi

 for stu in ../sgms_data/students/*.stu; do

        sid=$(sed -n '1p' "$stu")
        name=$(sed -n '2p' "$stu")

        total=0
        count=0

        for file in ../sgms_data/grades/*.grd; do

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
        gpa=$(echo " $total / $count" | bc -l )
            echo "$name ${gpa: 0:4}"
        fi
    done | sort -k2 -nr

}





