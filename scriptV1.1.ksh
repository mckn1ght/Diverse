#!/bin/ksh

#Thi22s KSH checks all the files in the location of this script and replaces the first occurence of the keyword "R2I01R" with "R2I02R" in all the .ksh files found.

########################
#	 	VARIABLES	   #
########################

CURRENT_SCRIPT_NAME=$0
TEXT_TO_BE_REPLACED=$1
REPLACEMENT_TEXT=$2 
i=0
########################

export logfile=`date "+%d%m%Y-%H%M%S"`.txt

echo "`date "+%d%m%Y-%H%M%S"`: Starting script " >> $logfile 

echo `date "+%d%m%Y-%H%M%S"` ": Searching for keyword: $TEXT_TO_BE_REPLACED. Will replace with keyword: $REPLACEMENT_TEXT" >> $logfile 

for FILE in *;

do

if [[ "./$FILE" != "$CURRENT_SCRIPT_NAME" && $FILE == *.ksh ]]; then #Checks if the file is not current script and checks that it is a .ksh file
	i=$((i+1))
	echo "`date "+%d%m%Y-%H%M%S"`: Parsing file number $i: $FILE " >> $logfile 
	awk 'NR==1,/'"$TEXT_TO_BE_REPLACED"'/{sub(/'"$TEXT_TO_BE_REPLACED"'/, "'$REPLACEMENT_TEXT'")} 1' $FILE > FILE.new && chown --reference=$FILE FILE.new && chmod --reference=$FILE FILE.new && mv FILE.new $FILE
	#sed -i '' 's/'"$TEXT_TO_BE_REPLACED"'/'"$REPLACEMENT_TEXT"'/g' "$FILE" Replaces all occurences in a file
else

	if [ "./$FILE" == "$CURRENT_SCRIPT_NAME" ];then

		echo "`date "+%d%m%Y-%H%M%S"`: $FILE found but it is the currently running script so it will not be modified" >> $logfile
	
	else	

		echo "`date "+%d%m%Y-%H%M%S"`: $FILE found but it is not a .ksh file so it will not be modified." >> $logfile

	fi

fi

done

echo "`date "+%d%m%Y-%H%M%S"`: Finished! Total files parsed: $i " >> $logfile

