#! /usr/bin/bash

function list_students(){

	if [[ ! -d "../sgms_data/students" || -z "$(ls ../sgms_data/students)" ]]; then
		echo "not founded any students"
	return
	fi

  	for file in ../sgms_data/students/*.stu
   	 do
       		 echo "----------------------"
       		 cat "$file"
    	done

}
