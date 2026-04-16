#! /usr/bin/bash

function list_students(){

	if [[ ! -d "students" || -z "$(ls students)" ]]; then
		echo "not founded any students"
	return
	fi

  	for file in students/*.stu
   	 do
       		 echo "----------------------"
       		 cat "$file"
    	done

}

list_students
