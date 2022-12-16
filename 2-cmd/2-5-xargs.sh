#!/bin/bash
#xargs紧跟在管道操作符之后  使用标准输入作为主要数据源:
ls * | xargs grep ctime

#xargs 默认执行echo 命令 会将多行输入转换成为单行输出
# -n 选项可以限制每次调用的参数个数
echo "-n"
cat ex.txt | xargs -n 3

#xargs 默认使用空白字符分割输入  文件和目录中包含空格和换行就会出现问题
#-d  为输入数据指定自定义的分隔符
echo abcdefgdhid | xargs -d d

#命令行中格式化数据
cat args.txt | xargs -n 1 ./cecho.sh

#-I 指定替换字符串  {}每次都被替换为相应的参数
cat args.txt  | xargs -I {} ./cecho.sh  -p {} -1

#find 与 xargs结合使用
#谨慎使用 不确定find的分割符是什么的情况下  xargs 默认空格符是分隔符
#find . -type f -name "*.txt" -print0 | xargs -0 rm -f

#统计文件行数
find . -type f -name "*.sh" -print0 | xargs -0 wc -l

#xargs无法为多个命令提供参数 利用{}创建子shell
cat ex.txt  | ( while read ; do cat $arg; done )

#shell的-c选项也可以调用子shell
#找出所有的txt文件 文件名前加上换行符 找出文件中包含abc的行
find . -name '*.txt' | xargs -I ^ sh -c "echo -ne '\n ^: '; grep abc ^"

#tr 字符替换 字符删除  重复字符压缩
#tr  只能通过stdin 标准输入接收输入，无法通过命令行参数接收
#set1 set2 字符类  若长度不相等，则知道长度与set1相同为止
#tr [option[ set1 set2
echo "ABCDEFGHIGK" | tr 'A-Z' 'a-z'

#加密
echo 12345 | tr '0-9' '987654321'
#解密
echo 87654 | tr '987654321' '0-9'
#ROT13  加密和解密使用同一套算法
echo "tr came, tr saw,tr conquered." | tr 'a-zA-Z' 'n-za-mN-ZA-M'

#制表符转换成为单个空格
tr '\t' ' ' < ex.txt

#-d选项删除字符
echo "Hello 123 world 456!" | tr -d '0-9'

#将12替换成23
tr '12' '23' < ex.txt 
#将非 0-8的值替换为a
tr -c '0-8' 'a' < ex.txt
#删除5-9的补集
tr -c -d  '5-9' < ex.txt 
echo "hello 1 I 2 am happy 4!" | tr -d -c '0-9 \n'
echo "hello 1 I 2 am happy 4!" | tr -c '0-9' '\n'

#tr -s '[]'  压缩字符
#删除多余空格
echo "1234 1234    hello" | tr -s ' '

#文件中的数字列表相加
cat sum.txt  | echo $[ $(tr '\n' '+' ) 0 ]
#去除字符再相加
cat sumc.txt | tr -d [a-z] | echo $[ $(tr ' ' '+' ) ]

#字符类
#字母和数字 字母 控制（非打印字符） 数字 图形字符 小写字母 可打印字符 标点符号 空白字符 大写字母 十六进制字符
