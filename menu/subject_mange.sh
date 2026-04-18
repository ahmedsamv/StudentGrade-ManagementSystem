#! /usr/bin/bash
source ../subject_managment/addsubject

source ../subject_managment/update_subject
source ../subject_managment/list_subjects 
source ../subject_managment/delete_subject

function subject_manage() {
  
        echo "=================================="
        echo " Please choose from the menu below:"
        echo "=================================="
    select choice in "Add Subject" "List Subjects"  "Update Subject" "Delete Subject" "Exit"
    do
        case $choice in
            "Add Subject")  add_subject ;; 
            "List Subjects")  list_subjects;;
            "Update Subject")  update_subject  ;; 
            "Delete Subject")  delete_subject  ;; 
            "Exit") break ;;
            *) echo "Invalid choice" ;;
        esac
    done
     
}
