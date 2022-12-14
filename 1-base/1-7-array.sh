#!/bin/bash
#普通数组和关联数组
#d定义数组·
#这些值会存储在以0为起始索引的连续位置上
array_var=(test1 test2 test3 test4)
array_var[4]="tets5"

#打印出特定索引的数组元素内容o
echo ${array_var[0]}
index=3
echo ${array_var[$index]}

#以列表形式打印出数组的所有值
echo ${array_var[*]}
echo ${array_var[@]}

#打印数组长度 数组中元素的个数o
echo ${#array_var[*]}

#声明语句将1个变量定义为关联数组
declare -A ass_array
#使用行内部 “索引-值”列表
ass_array=([index1]=val1 [index2]=val2)
# 使用独立的“索引-值”进行赋值
ass_array[index3]=val3
#ass_array`index4]=val4


declare -A fruits_value
fruits_value=([apple]='100 dollars' [orange]='150 dollars')
echo "Apple costs ${fruits_value[apple]}"

#列出数组索引
echo ${!array_var[*]}
echo ${!fruits_value[@]}


#别名 alias
#创建别名 alias new_commands='command sequences'
alias apti='sudo apt=get install'
#alias只是暂时的，一旦关闭当前终端，设置过的别名就失效了
#要使得别名在所有的shell中使用，将其定义放入~/.bashrc中
echo 'alias cmd="command seq"'  >> ~/.bashrc
#删除别名 从~/.bashrc中删除  使用unalias删除
#也可以删除alias example=，取消别名

#创建别名rm 能够删除原始文件，同时在backup目录中备份
alias rm='cp $@ ~/backup && rm $@'
#若已有同名别名存在，新别名会取代旧别名中的内容

#若用户为特权用户，别名容易造成安全问题  
#别名转义 \command
#列举当前定义的所有别名
alias
