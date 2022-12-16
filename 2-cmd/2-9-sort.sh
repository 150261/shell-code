#!/bin/bash
#行排序 sort
sort sum.txt  sumc.txt > sorted.txt
sort sum.txt  sumc.txt -o  sortedc.txt

#按照数字顺序排序
sort -n sum.txt

#按照逆序排序
sort -r sum.txt

#按照月份排序
#sort -M month.txt

#合并两个文件排序
sort -m sum.txt sumc.txt

#找出不重复的行
sort -m sum.txt sumc.txt | uniq
#检查文件是否排序过
#sort -C filename

#-k 指定排序依据的字符
sort -nrk 1 key-value.txt

#
sort -bk 2.3,2.4 data.txt
sort -bk 2.3 data.txt 

#第一个字符作为键
sort -nk 1.1 data.txt

#sort输出与\0为终止符的xargs命令兼容
sort -z data.txt | xargs -0

#忽略标点符号并以字典序排序
#-b 忽略文件中的前导空白行 -d 字典序进行排序
sort -bd data.txt 

#uniq 找出唯一的行 只能作用于排过序的数据
#重复的行只打印一次
uniq uniqed.txt 

#去除重复的行
uniq -u uniqed.txt 
#统计各行在文件中出现的次数
uniq -c uniqed.txt 
sort uniqed.txt | uniq -c
#找出文件中重复的行
uniq -d uniqed.txt

#-s指定跳过前n个字符  -w 指定用于比较的最大字符数
uniq -s 1 uniqed.txt 
uniq -s 2  -w 2 udata.txt 

#-z选项可以生成由0值字节终止的输出
#0值字节终止符 这样\0作为定界符
#uniq -z udata.txt  | xargs -0 rm
