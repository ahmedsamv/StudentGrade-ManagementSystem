#! /usr/bin/bash

source addsubject
source update_subject
source list_subjects 
source delete_subject

function subject_manage() {
  
        echo "=================================="
        echo " Please choose from the menu below:"
        echo "=================================="
    select choice in "Add Subject" "List Subjects"  "Update Subject" "Delete Subject" "back"
    do
        case $choice in
            "Add Subject")  add_subject ;; 
            "List Subjects")  list_subjects;;
            "Update Subject")  update_subject  ;; 
            "Delete Subject")  delete_subject  ;; 
            "back") return ;;
            *) echo "Invalid choice" ;;
        esac
    done
     
}
