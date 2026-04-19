#! /usr/bin/bash	
source  student_grade 
source subject_mange.sh
source student_mange.sh
source reports_statistics
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
            "Manage Grades")  student_grade ;; 
            "Reports & Statistics") reports_statistics  ;; 
            "Exit") exit ;;
            *) echo "Invalid choice" ;;
        esac
    done
    done
}

main_menu
