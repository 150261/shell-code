#!/bin/bash
#函数定义
#函数访问参数
#$0 脚本名称  $n 第n个参数 
#$@   $^

function getIP() { /sbin/ifconfig $1 | grep 'inet'; }

getIP ens33;

#递归调用
#Fork 炸弹

#函数可用export导出  这样函数的作用域可以扩展到子进程中
#export -f fun

#命令行参数的使用
#shift 命令可以将参数依次向左移动一个位置 让脚本可以使用$1来迭代访问每一个参数

#将1个命令的输出发送给另外1个命令
#管道|
#赋值给变量  cmd-output=$(ls | cat -n)
#反引用 ··   cmd-output=`ls | cat -n `

#子shell就是独立的进程
#子shell和反引用 将输出保存到变量中，为了保留输出的空格和换行符 必须使用双引号
#out="$(cat text.txt)"

#持续运行命令直到成功位置
#while 循环 $@ :  延时
#for循环
echo {1..10}
echo {a..y}
#until循环  直到条件为真停止

#字段分隔符 IFS 与迭代器
#IFS=,     IFS=" "

#if else 语句
#[ condition ] && action;  条件为真时执行语句
#[ condition ] || action;  条件为假时执行语句

#比较操作 [  ]
#-gt  >     -lt   <
#-ge >=     -le   <=
#-a 逻辑与   -o  逻辑或

#文件系统
#-f -x -d -e -c -b -w -r -L

#字符串比较  [[]]  bash的特性  单个[]可能会产生错误 字符串比较是根据ASCII值比较的
#空串 -z 为空   -n 不为空 

#test命令可以测试条件 test是外部程序 需要衍生对应的进程 []是bash的脑补函数 []的效率更高

#使用配置文件定制shell
#登录时执行的  启动交互式shell所执行的  调用shell处理脚本文件时执行的
