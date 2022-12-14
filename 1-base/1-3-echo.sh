#!bin/bash
#文件名:printf.sh


printf "%-5s %-10s %-4s\n"  No Name Mark
printf "%-5s %-10s %-4.2f\n" 1 ASearch 80.3456
printf "%-5s %-10s %-4.2f\n" 2 James 90.9989
printf "%-5s %-10s %-4.2f\n" 3 Jeff 77.564

echo -n "hello"
echo "\n"
echo -e "1\t2\t3"

echo -e "\e[1;32m This is greeen text \e[0m"
echo -e "\e[1;42m Green Backgroud \e[0m"

#man console_codes   查看转义字符



#环境变量
env
#查看某个进程的环境变量
pgrep shell
sudo cat /proc/1135/environ 
#生成易读d的报告
sudo cat /proc/1135/environ | tr '\0' '\n'

#变量
#var=value 不等于 var = value
#前者为赋值运算 后者为等量关系测试
var=“123456”
echo $var
echo ${var}

#环境变量从父进程继承来的变量
#export 声明了由子进程继承的1个或者多个变量

#PATH 变量增加新路径
#export PATH="$PATH:/home/user/bin"
#常用的环境变量 HOME UID SHELL
#变量值的长度 ${#var}

#修改提示符号 ~/.bashrc   PS1
#t添加函数  环境变量添加路径
#prepend() { [ -d "$2" ] && eval $1=\"$2':'\$$1\" && export $1; }
#prepend PATH /opt/myapp/bin
#shell参数扩展  $(parameter:+expression)

