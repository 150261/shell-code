#!/bin/bash 
#文件名: rename.sh 
#用途: 重命名 .jpg 和 .png 文件
count=1; 
for img in `find . -iname '*.png' -o -iname '*.jpg' -type f -maxdepth 1` 
do 
 new=image-$count.${img##*.} 
 echo "Renaming $img to $new" 
 mv "$img" "$new" 
 let count++ 
done 

