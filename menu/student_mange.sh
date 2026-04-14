#! usr/bin/bash


function student_manage() {
   while true; do
        echo "=================================="
        echo " Please choose from the menu below:"
        echo "=================================="
    select choice in "Add Student" "List Students"  "Update Student" "Delete Student" "Exit"
    do
        case $choice in
            "Add Student") echo 'stu' ;; 
            "List Students") echo 'sub';;
            "Update Student") echo 'grad';; 
            "Delete Student") echo 'rep'  ;; 
            "Exit") exit ;;
            *) echo "Invalid choice" ;;
        esac
    done
    done
}
