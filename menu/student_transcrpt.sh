#! /usr/bin/bash


function student_transcript(){

if [[ ! -d "../sgms_data/students" || -z "$(ls "../sgms_data/students")" ]]; then
        echo "No students found"
        return
    fi
while true
do
    read -p "Enter student ID: " sid

    student_file="../sgms_data/students/$sid.stu"

    if [[ -f "$student_file" ]]; then
        break
             else    
     		echo "student not found try again"
    fi
  done
    
    name=$(sed -n '2p' "$student_file")
    email=$(sed -n '3p' "$student_file")
    year=$(sed -n '4p' "$student_file")

    echo "----- Student Info -----"
    echo "ID: $sid"
    echo "Name: $name"
    echo "Email: $email"
    echo "Year: $year"

    echo ""
    echo "----- Grades -----"
    found=0

    for file in "../sgms_data/grades"/*.grd
    do
        [[ -f "$file" ]] || continue

        code=$(basename "$file" .grd)

        line=$(grep "^$sid|" "$file")

        if [[ -n "$line" ]]; then
            found=1
            score=$(echo "$line" | awk -F"|" '{print $2}')
            letter=$(echo "$line" | awk -F"|" '{print $3}')

            echo "$code | $score | $letter"
        fi
    done

    if [[ $found == 0 ]]; then
        echo "No grades found"
    fi
    
    

    gpa=$(awk -F"|" -v id="$sid" '
    BEGIN {
        total = 0
        count = 0
    }

    $1 == id {
        if ($3 == "A") point=4
        else if ($3 == "A+") point=4.0
        else if ($3 == "A-") point=3.7
        else if ($3 == "B+") point=3.3
        else if ($3 == "B") point=3.0
        else if ($3 == "B-") point=2.7
        else if ($3 == "C+") point=2.3
        else if ($3 == "C") point=2.0
        else if ($3 == "C-") point=1.7
        else if ($3 == "D") point=1.0
        else point=0

        total += point
        count++
    }

    END {
        if (count > 0)
            printf "%.2f", total / count
        else
            print "0.00"
    }
    ' "../sgms_data/grades"/*.grd)

    echo "GPA: $gpa"
}


