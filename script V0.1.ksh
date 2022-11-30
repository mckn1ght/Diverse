#!/bin/ksh

#This KSH checks all the files in the location of this script and replaces the first occurence of the keyword "R2I01R" with "R2I02R" in all the .ksh files found.

#TEXT_TO_BE_REPLACED="R2I01R"
#REPLACEMENT_TEXT="R2I02R" 
CURRENT_SCRIPT_NAME="script.ksh"
i=0

echo "Searching for keyword: $TEXT_TO_BE_REPLACED. Will replace with keyword: $REPLACEMENT_TEXT"

for FILE in *;

do

if [[ "$FILE" != "$CURRENT_SCRIPT_NAME" &&  $FILE == *.ksh  ]]; then 
	i=$((i+1))
	echo "File number $i en cours de traitement: $FILE"
	awk 'NR==1,/R2I01R/{sub(/R2I01R/, "R2I02R")} 1' $FILE > FILE.new && mv FILE.new $FILE
	chmod 777 $FILE
else
	if [ "$FILE" == "$CURRENT_SCRIPT_NAME" ];then
		echo "$FILE found but it is the currently running script so it will not be modified"
	else	
		echo "$FILE found but it is not a .ksh file so it will not be modified."
	fi
fi

done

echo "Finished! Total files modified: $i"
