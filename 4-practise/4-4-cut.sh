#!/bin/bash
#cut命令可以按列，而不是按行来切分文件。该命令可用于处理使用固定宽度字段的文件、
#选项-f可以指定要提取的字段 想提取多个字段，就得给出由逗号分隔的多个字段编号
# cut -f 2,3 filename

#cut命令也能够从stdin中读取输入
#选项-s可以禁止打印出没有使用分隔符的行

#--complement选项显示出没有被-f指定的那些字段

#选项-d能够设置分隔符。
#cut -f2 -d";" delimited_data.txt

#N- 从第N个字节、字符或字段开始到行尾
#N-M 从第N个字节、字符或字段开始到第M个（包括第M个在内）字节、字符或字段
#-M 从第1个字节、字符或字段开始到第M个（包括第M个在内）字节、字符或字

#-b 表示字节 -c 表示字符 -f 用于定义字段
#选项--output-delimiter可以指定输出分隔符

#sed是stream editor（流编辑器）的缩写。它最常见的用法是进行文本替换
#sed可以使用另一个字符串来替换匹配模式。模式可以是简单的字符串或正则表达式

#sed 's/pattern/replace_string/' file
#选项-i会使得sed用修改后的数据替换原始文件

#之前的例子只替换了每行中模式首次匹配的内容。g标记可以使sed执行全局替换
#sed 's/pattern/replace_string/g' file 

#sed命令会将s之后的字符视为命令分隔符。这允许我们更改默认的分隔符/
#sed 's|text|replace|g'
#如果作为分隔符的字符出现在模式中，必须使用\对其进行转义

#空行可以用正则表达式 ^$ 进行匹配 /d告诉sed不执行替换操作，而是直接删除匹配到的空行
#sed '/^$/d' file

#使用选项-i 直接在文件中替换
#已匹配字符串标记（&）
#子串匹配标记（\1）
#对于匹配到的第一个子串，其对应的标记是\1，匹配到的第二个子串是\2，往后以此类推。
echo seven EIGHT | sed 's/\([a-z]\+\) \([A-Z]\+\)/\2 \1/' 

#多个sed命令，多个模式之间可以用分号分隔，或是使用选项-e PATTERN
#sed表达式通常用单引号来引用,如果想在sed表达式中使用变量，双引号就能派上用场了

#使用 awk 进行高级文本处理
#awk命令可以处理数据流。它支持关联数组、递归函数、条件语句等功能

#awk 'BEGIN{ print "start" } pattern { commands } END{ print "end" }' file
#awk脚本通常由3部分组成：BEGIN、END和带模式匹配选项的公共语句块（common statement block）。这3个部分都是可选的，

#awk以逐行的形式处理文件

#print能够接受参数。这些参数以逗号分隔，在打印参数时则以空格作为参数之间的分隔符。
echo | awk '{ var1="v1"; var2="v2"; var3="v3";print var1,var2,var3 ; }'

#awk可以使用的一些特殊变量
#NR：表示记录编号，当awk将行作为记录时，该变量相当于当前行号
#NF：表示字段数量，在处理当前记录时，相当于字段数量。默认的字段分隔符是空格
#$0：该变量包含当前记录的文本内容
#$1：该变量包含第一个字段的文本内容

#print $NF打印一行中最后一个字段
#选项-v，我们可以将外部值（并非来自stdin）传递给awk
VAR=10000 
echo | awk -v VARIABLE=$VAR '{ print VARIABLE }' 

#用getline读取某一行
#使用过滤模式对awk处理的行进行过滤
#默认的字段分隔符是空格 选项-F指定不同的分隔符： OFS="delimiter"设置输出字段分隔符
awk -F: '{ print $NF }' /etc/passwd
awk 'BEGIN { FS=":" } { print $NF }' /etc/passwd 

#awk中使用循环
#awk内建的字符串处理函数
