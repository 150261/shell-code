#!/bin/bash
#JavaScript

#用paste命令实现按列合并
#默认的分隔符是制表符，也可以用-d指定分隔符
#paste file1 file2 file3 ...


#打印从M行到N行之间的文本：
#awk 'NR==M, NR==N' filename

#打印位于模式start_pattern与end_pattern之间的文本：
# awk '/start_pattern/, /end_pattern/' filename 
awk '/pa.*3/, /end/' section.txt

#以逆序形式打印行
#最简单的实现方法是使用tac命令
#tac file1 file2 ...
#tac命令默认使用\n作为行分隔符。但我们也可以用选项-s指定其他分隔符。

#解析文本中的电子邮件地址和 URL
egrep -o '[A-Za-z0-9._]+@[A-Za-z0-9.]+\.[a-zA-Z]{2,4}' url_email.txt 
egrep -o "http://[a-zA-Z0-9.]+\.[a-zA-Z]{2,3}" url_email.txt

#文本切片与参数操作
var="This is a line of text" 
echo ${var/line/REPLACED}

#通过指定字符串的起始位置和长度来生成子串，
#{variable_name:start_position:length}

#可以打印出第5个字符之后的内容
string=abcdefghijklmnopqrstuvwxyz
echo ${string:4}

#从第5个字符开始，打印8个字符
echo ${string:4:8}
#字符串起始字符的索引从0开始。从后向前计数，字符串末尾字符的索引为-1。
echo ${string:(-1)} 
echo ${string:(-2):2}
