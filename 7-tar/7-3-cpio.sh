#!/bin/bash
#cpio通过stdin获取输入文件名并将归档文件写入stdout

#-o指定了输出
#-v用来打印归档文件列表

#归档测试文件
# ls file* | cpio -ov > archive.cpio

#列出cpio归档文件中的内容
#  cpio -it < archive.cpio 

#从cpio归档文件中提取文件
# cpio -id < archive.cpio 

#-i用于指定输入

#-t用于列出归档文件中的内容
#-o表示提取，cpio会直接覆盖文件，不作任何提示
#-d在需要的时候创建新的目录。

#gzip、gunzip和zcat都可以处理gzip压缩格式 只能压缩/解压缩单个文件或数据流，无法直接归档目录和多个文件
#在gzip可以同tar和cpio配合使用

#gzip压缩文件  gzip filename

# 解压缩gzip文件：   gunzip filename.gz

#列出压缩文件的属性信息 gzip -l test.txt.gz 

# gzip命令可以从stdin中读入文件并将压缩文件写出到stdout
# cat file | gzip -c > file.gz


#选项 -c用来将输出指定到stdout。该选项也可以与cpio配合使用：
# ls * | cpio -o | gzip -c > cpiooutput.gz 

#定gzip的压缩级别。--fast或--best选项分别提供最低或最高的压缩率

#后缀.gz表示的是经过gzip压缩过的tar归档文件
# tar -czvvf archive.tar.gz [FILES]
#tar -cavvf archive.tar.gz [FILES] 

#选项-z指明用gzip进行压缩，选项-a指明根据文件扩展名推断压缩格式

# tar -cvvf archive.tar [FILES] 
#gzip archive.tar 

#zcat命令无需经过解压缩操作就可以将.gz文件的内容输出到stdout .gz文件不会发生任何变化

#指定压缩率，它共有9级
#1级的压缩率最低，但是压缩速度最快
#9级的压缩率最高，但是压缩速度最慢

#gzip -5 test.img

#bzip2在功能和语法上与gzip类似。不同之处在于bzip2的压缩效率比gzip更高，但花费的时间比gzip更长

#用bzip2进行压缩 bzip2 filename

#解压缩bzip2格式的文件   bunzip2 filename.bz2 

#-j表明该归档文件是以bzip2格式压缩的
#tar -xjvf archive.tar.bz2

#lzma的压缩率要优于gzip和bzip2
#使用lzma进行压缩： lzma filename

#解压缩lzma文件  unlzma filename.lzma

#可以使用--lzma选项压缩生成的tar归档文件： tar -cvvf --lzma archive.tar.lzma [FILES]

#将lzma压缩的tar归档文件中的内容提取到指定的目录中
# tar -xvvf --lzma archive.tar.lzma -C extract_directory

#-x用于提取内容，--lzma指定使用lzma解压缩归档文件。
