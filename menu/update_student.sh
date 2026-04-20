#! /usr/bin/bash



function check_name(){

		    
		    while true;
		do
			read -p "Enter new name: " name
			if [[ -z "$name" ]]; then
			echo "name cant be empty"
			else
			sed -i "2s/.*/$name/" "$file"
			break
			fi
		done
		    
}

function check_email (){

while true;
		do 
			    read -p "Enter new email: " email
			if [[ "$email" =~  ^.+@.+\..+$ ]]; then
			  sed -i "3s/.*/$email/" "$file"
			break 
			else
			echo "please input valid email"
			fi
		done
}

function check_year(){
		while true; 
		do
			read -p "Enter new year: " year
			if [[ "$year" =~ ^[1-6]$  ]]; then
			sed -i "4s/.*/$year/" "$file"
			break
			else
			echo "please input valid number "
			fi
		done

}

function uptade_student(){


if [[ ! -d "../sgms_data/students" || -z "$(ls "../sgms_data/students")" ]]; then
        echo "No students found"
        return
    fi


while true
do



read -p "enter id student you want update: " id 

file="../sgms_data/students/$id.stu"


    if [[ ! -f "$file" ]]; then
        echo "student not found"
        continue
    fi

while true; do
      
         echo "What do you want to update?"
  
    select choice in "name" "email" "year" "exit"
    do
        case $choice in
            "name")  
			check_name
		    ;;
            "email") 
                    	check_email
                      ;;
            "year") 
                  	check_year
           		 ;;
            "exit") return ;;
            *) echo "Invalid choice" ;;
        esac
         echo "Updated successfully"
    done
    
    done
    	
    
done

}
