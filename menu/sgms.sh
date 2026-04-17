#! /usr/bin/bash	

source student_mange.sh 
function main_menu() {
   while true; do
        echo "=================================="
        echo " Please choose from the menu below:"
        echo "=================================="
    select choice in "Manage Students" "Manage Subjects"  "Manage Grades" "Reports & Statistics" "Exit"
    do
        case $choice in
            "Manage Students") student_manage ;; 
            "Manage Subjects") subject_manage ;;
            "Manage Grades")  student_grades ;; 
            "Reports & Statistics") echo 'rep'  ;; 
            "Exit") exit ;;
            *) echo "Invalid choice" ;;
        esac
    done
    done
}

main_menu
