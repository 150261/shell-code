#!/bin/bash
#从键盘输入读取n个字符并存入变量var
read -n 2 var
echo -e "\n"
echo "$var"

#无回显
read -s var

#提示信息
read -p "Enter parameter:" var

#在给定时间里输入
echo  "在3秒内输入值:"
read -t 3 var

#用特定的定界符作为输入行的结束
read -d ":" var
echo $var
