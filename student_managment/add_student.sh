#! /usr/bin/bash 

mkdir -p students
function add_student () {
while true;
do

echo 'add student'


while true; 
do
read -p "Enter Student ID: " id 
if [[ "$id" =~ ^[1-9][0-9]*$ ]]; then 
break
else 
echo "please enter valid id "
fi
done

file="students/$id.stu"
 if [[ -f "$file" ]]; then
        echo "Student already exists!"
        continue
    fi


while true;
do
read -p "Enter Full name: " name
if [[ -z "$name" ]]; then
echo "name cant be empty"
else
break
fi
done


while true;
do 
read -p "Enter Email: " email
if [[ "$email" =~  ^.+@.+\..+$ ]]; then
break 
else
echo "please input valid email"
fi
done

while true; 
do
read -p "Enter Academic year (1-6): " year
if [[ "$year" =~ ^[1-6]$  ]]; then
break
else
echo "please input valid number "
fi
done




echo "$id" >> "$file"

echo "$name" >> "$file"
echo "$email" >> "$file"
echo "$year" >> "$file"
echo "student added successfully"

read -p "do you want add more student? (y/n): " sure
if [[ "$sure" == "y" || "$sure" == "Y" ]]; then
continue
else
break
fi

done

}

add_student
