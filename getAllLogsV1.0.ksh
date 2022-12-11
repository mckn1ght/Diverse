#!/bin/ksh

##################
#    VARIABLES   #
##################
RUN_ID=$1
PATH_WORKFLOW=/Users/robertcostache/Documents
PATH_SESSION=/Users/robertcostache/Desktop
PATH_SCRIPT_LOG=/Users/robertcostache/Desktop/IBM/GetAllLogs
flag=0
##################

# de adaugat path_workflow
for FILE in $PATH_WORKFLOW/*;

do

if [[ $FILE == *"$RUN_ID"* ]]; then

    if [ -e $RUN_ID.zip ]; then #verify if the archive exists and add the file in it
     #tar --append --file=collection.tar rock
    zip -ur $RUN_ID.zip $FILE
    flag=1
    else #create the archive and add the file in it
    
    zip $RUN_ID.zip $FILE
    flag=1
    fi
else 

echo "Parsed $FILE. RunId not compliant"

fi

done

# de adaugat path_sessions
for FILE in $PATH_SESSION/*;

do

if [[ $FILE == *"$RUN_ID"* ]]; then

    if [ -e $RUN_ID.zip ]; then #verify if the archive exists and add the file in it
     #tar --append --file=collection.tar rock
    zip -ur $RUN_ID.zip $FILE
    flag=1
    else #create the archive and add the file in it
    
    zip $RUN_ID.zip $FILE
    flag=1
    fi
else

echo "Parsed $FILE. RunId not compliant"

fi

done

# de agaugat path_script_log
for FILE in $PATH_SCRIPT_LOG/*;

do

if [[ $FILE == *"$RUN_ID"* ]]; then

    if [ -e $RUN_ID.zip ]; then #verify if the archive exists and add the file in it
     #tar --append --file=collection.tar rock
    zip -ur $RUN_ID.zip $FILE
    flag=1
    else #create the archive and add the file in it
    
    zip $RUN_ID.zip $FILE
    flag=1
    fi
else

echo "Parsed $FILE. RunId not compliant"

fi

done

if [ $flag == 1 ]; then

    echo "Archive location is: $(pwd)"

else
    
    echo " RunID not found!"

fi

