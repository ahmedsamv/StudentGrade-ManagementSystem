#! /usr/bin/bash 

mkdir -p students
function add_student () {

echo 'add student'
read -p "Enter Student ID: " id 
read -p "Enter Full name: " name
read -p "Enter Email: " email
read -p "Enter Academic year (1-6): " year

echo $id
file="students/$id.stu"
 if [[ -f "$file" ]]; then
        echo "Student already exists!"
        return
    fi

echo "$id" >> "$file"

echo "$name" >> "$file"
echo "$email" >> "$file"
echo "$year" >> "$file"
echo "student added successfully"
}

add_student
