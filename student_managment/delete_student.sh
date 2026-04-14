#! /usr/bin/bash 

function delete_student(){
read -p "Enter Student Id you want to delete: " id 

file="students/$id.stu"
if [[ ! -f "$file" ]] ; then
echo "student not found"
return
fi

read -p "are you sure to delete? (y/n): " sure
if [[ "$sure" == "y" || "$sure" == "Y" ]]; then 
 rm "$file"
 echo "student is deleted "
 else 
 echo "cancel"
 fi
}

delete_student
