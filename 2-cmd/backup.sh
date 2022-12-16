#!/bin/bash 
# backup.sh 
# 使用后缀备份文件。不备份以~开头的临时文件
read -p " What folder should be backed up: " folder 
read -p " What type of files should be backed up: " suffix 
find $folder -name "*.$suffix" -a ! -name '~*' -exec cp {} \ 
 $BACKUP/$LOGNAME/$folder 
echo "Backed up files from $folder to $BACKUP/$LOGNAME/$folder" 

#脚本使用
#echo -e "notes\ndocx\n" | ./backup.sh
