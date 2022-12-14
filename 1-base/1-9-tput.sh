#!/bin/bash
#采集终端
tput cols
tput lines
#打印当前的终端名
tput longname
#将光标移动到坐标(100,100)
tput cup 100 100

#设置终端背景色 0~7
tput setb 0 
#设置终端前景色
tput setf 7

#设置文本样式为粗体
tput bold

#设置和删除下划线
tput smul
tput rmul

#删除从当前光标位置到行尾的所有内容
tput ed

#stty -echo 禁止将输出发送到终端
