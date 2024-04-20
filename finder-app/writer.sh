#!/bin/sh

if [ $# -lt 2 ]
then
	echo "please specifiy the file and the text to write"
	exit 1
fi


writefile=$1
writestr=$2

#echo "writefile : " ${writefile} ", write string : " ${writestr} 

if [ -w ${writefile}  ]
then
	echo ${writestr} > ${writefile}
	exit 0
else
	#touch ${writefile}
	write_dir=$(dirname ${writefile} )
	mkdir -p ${write_dir}
	#echo "directory name : " ${write_dir}
	echo ${writestr} > ${writefile}
	if [ $? -eq 0 ]
	then
		#echo ${writestr} > ${writefile}
		exit 0
	else
		echo "Could not create " ${writefile}
		exit 1
	fi
fi
