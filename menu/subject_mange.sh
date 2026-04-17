#! /usr/bin/bash


function subject_manage() {
  
        echo "=================================="
        echo " Please choose from the menu below:"
        echo "=================================="
    select choice in "Add Subject" "List Subjects"  "Update Subject" "Delete Subject" "Exit"
    do
        case $choice in
            "Add Subject") echo 'stu' ;; 
            "List Subjects") echo 'sub';;
            "Update Subject") echo 'grad';; 
            "Delete Subject") echo 'rep'  ;; 
            "Exit") break ;;
            *) echo "Invalid choice" ;;
        esac
    done
     
}
