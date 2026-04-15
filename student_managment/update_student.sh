#! /usr/bin/bash

function uptade_student(){
while true;
do
read -p "enter id student you want update: " id 

file="students/$id.stu"


    if [[ ! -f "$file" ]]; then
        echo "student not found"
        return
    fi

while true; do
      
         echo "What do you want to update?"
  
    select choice in "name" "email" "year" "exit"
    do
        case $choice in
            "name")  
		    read -p "Enter new name: " name
		    sed -i "2s/.*/$name/" "$file"
		    ;;
            "email") 
                        read -p "Enter new email: " email
           	     sed -i "3s/.*/$email/" "$file"
                      ;;
            "year") 
                        read -p "Enter new year: " year
          		  sed -i "4s/.*/$year/" "$file"
           		 ;;
            "exit") exit ;;
            *) echo "Invalid choice" ;;
        esac
         echo "Updated successfully"
    done
    
    done
    	
    
done

}

uptade_student
