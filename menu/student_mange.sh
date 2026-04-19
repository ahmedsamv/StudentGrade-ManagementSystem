#! /usr/bin/bash

source add_student.sh
source update_student.sh
source list_students.sh
source delete_student.sh

function student_manage() {
   while true; do
        echo "=================================="
        echo " Please choose from the menu below:"
        echo "=================================="
    select choice in "Add Student" "List Students"  "Update Student" "Delete Student" "back"
    do
        case $choice in
            "Add Student")  add_student  ;; 
            "List Students") list_students ;;
            "Update Student") uptade_student ;; 
            "Delete Student") delete_student  ;; 
            "back") return ;;
            *) echo "Invalid choice" ;;
        esac
    done
    done
}


