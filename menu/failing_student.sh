#! /usr/bin/bash



function failing_students() {

if [[ ! -d "../sgms_data/students" || -z "$(ls "../sgms_data/students")" ]]; then
        echo "No students found"
        return
    fi


    if [[ ! -d "../sgms_data/grades"  || -z "$(ls "../sgms_data/grades")" ]]; then
        echo "No grades found"
        return
    fi


    echo "----- Failing Students -----"

    for stu in "../sgms_data/students"/*.stu
    do
        sid=$(sed -n '1p' "$stu")
        name=$(sed -n '2p' "$stu")

        for grd in "../sgms_data/grades"/*.grd
        do
            line=$(grep "^$sid|" "$grd")

            if [[ -n "$line" ]]
            then

                grade=$(echo "$line" | cut -d'|' -f3)

                if [[ "$grade" == "F" ]]
                then
                code=$(basename "$grd" .grd)
                    echo "$name - $code"
                    break
                fi

            fi
        done

    done
}
    

