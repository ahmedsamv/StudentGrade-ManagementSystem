#! /usr/bin/bash 

function delete_student(){
while true; 
do

if [[ ! -d "../sgms_data/students" || -z "$(ls ../sgms_data/students)" ]]; then
echo "no found students to deleted"
break
fi

read -p "Enter Student Id you want to delete: " id 
file="../sgms_data/students/$id.stu"
if [[ ! -f "$file" ]] ; then
echo "student not found"
continue
fi

read -p "are you sure to delete? (y/n): " sure
if [[ "$sure" == "y" || "$sure" == "Y" ]]; then 
 rm "$file"
 echo "student is deleted "
 
 else 
 echo "cancel"
 continue
 fi
 
 read -p "do you want delete student else? (y/n) " opt
 if [[ "$opt" == "y" || "$opt" == "Y" ]]; then
 continue
 else
 break
 fi
 
 done
}
