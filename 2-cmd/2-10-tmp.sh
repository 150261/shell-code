#!/bin/bash
#临时数据和随机数

#mktemp命令可以为临时文件或目录创建唯一的名字
#filename=`mktemp` 
echo $filename

#创建临时目录
#dirname=`mktemp -d`

#如果仅仅是想生成文件名，不希望创建实际的文件或目录
#tmpfile=`mktemp -u`

#基于模板创建临时文件名
#mktemp test.XXX 

#分割文件与数据
#为提高可读性、生成日志以
#及发送有大小限制的E-mail附件
#split命令 其中依据字母序排在首位的那个文件对应于原始文件的第一部分 以此类推
#将文件分成一系列10KB的小文件 单位k（KB）M（MB）、G（GB）、c（byte）和w（word）
#split -b 10k data.file 

#split默认使用字母后缀。如果想使用数字后缀，需要使用-d选项
#-a length 可以指定后缀长度
#split -b 10k data.file -d -a 4


#split_file为分割后的文件指定文件名前缀
#split -b 10k data.file -d -a 4 split_file

#如果不想按照数据块大小，而是根据行数来分割文件的话，可以使用 -l no_of_lines：
# split -l 10 data.file 

#csplit实用工具能够基于上下文来分隔文件。它依据的是行计数或正则表达式 日志文件分割
#将这个日志文件分割成server1.log、server2.log和server3.log
#/SERVER/ 用来匹配特定行
#/[REGEX]/ 用于描述文本模式。它从当前行（第一行）一直复制到（但不包括）包含SERVER的匹配行
#{*} 表示根据匹配重复执行分割操作，直到文件末尾为止。可以用{整数}的形式来指定分割执行的次数。
#-s 使命令进入静默模式，不打印其他信息
#-n 指定分割后的文件名后缀的数字个数
#-f 指定分割后的文件名前缀  -b 指定后缀格式
#分割后得到的第一个文件没有任何内容（匹配的单词就位于文件的第一行中
csplit server.log /SERVER/ -n 2 -s {*} -f server -b "%02d.log" 


#根据拓展名切分文件名   #操作符可以提取出扩展名
#%操作符可以从name.extension这种格式中提取name部分（文件名）
file_jpg="sample.jpg" 
name=${file_jpg%.*} 
echo File name is: $name

extension=${file_jpg#*.} 
echo Extension is: $extension

#${VAR%.*}
#从 $VAR中删除位于%右侧的通配符（在上例中是.*）所匹配的字符串。通配符从右向左进行匹配
#给VAR赋值，即VAR=sample.jpg。通配符从右向左匹配到的内容是.jpg，因此从$VAR中删除匹配结果

#%属于非贪婪（non-greedy）操作。它从右向左找出匹配通配符的最短结果
#%% 它与%相似，但行为模式却是贪婪的，这意味着它会匹配符合通配符的最长结果

VAR=hack.fun.book.txt
echo ${VAR%.*} 
echo ${VAR%%.*}

##操作符可以从文件名中提取扩展名。这个操作符与%类似，不过求值方向是从左向右。
#对应的贪婪操作符##
echo ${VAR#*.}
echo ${VAR##*.}
