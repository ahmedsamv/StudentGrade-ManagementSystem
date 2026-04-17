#! /usr/bin/bash


function student_transcript(){

    read -p "Enter Student ID: " sid

    student_file="../sgms_data/students/$sid.stu"

    if [ ! -f "$student_file" ]; then
        echo "Student not found!"
        return
    fi

    name=$(sed -n '2p' "$student_file")

 	echo "Student: $name" 
    echo "Subject   Score   Grade"

}

student_transcript
