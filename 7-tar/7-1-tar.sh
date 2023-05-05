#!/bin/bash

#tar可以将多个文件和文件夹打包为单个文件，同时还能保留所有的文件属性，如所有者、权限等
#用tar创建归档文件 选项-c表示创建新的归档文件。选项-f表示归档文件名
# tar -cf output.tar [SOURCES] 

#选项-t可以列出归档文件中所包含的文件
# tar -tf archive.tar 

#) 选项-v或-vv参数可以在命令输出中加入更多的细节信息。这个特性叫作“冗长模式（vverbose）”或“非常冗长模式（vv，very verbose）”

#选项-r可以将新文件追加到已有的归档文件末尾
# tar -rvf original.tar new_file

#选项-x可以将归档文件的内容提取到当前目录  选项-C来指定将文件提取到哪个目录：
# tar -xf archive.tar -C /path/to/extraction_directory

# 将文件名作为命令行参数来提取特定的文件：令只提取file1和file4，忽略其他文件。
# tar -xvf file.tar file1 file4

#tar cvf - files/ | ssh user@example.com "tar xv -C Documents/"

#用选项-A合并多个tar文件
#tar -Af file1.tar file2.tar

#用更新选项-u指明：只添加比归档文件中的同名文件更新（newer）的文件
#选项-d可以将归档中的文件与文件系统中的文件作比较

#用--delete选项从归档中删除文件：

#压缩格式 -j指定bunzip2格式 -z指定gzip格式 --lzma指定lzma格式

#为了让tar支持根据扩展名自动选择压缩算法，使用-a或--auto-compress选项：

#选项--exclude [PATTERN]可以将匹配通配符模式的文件排除在归档过程之外。
#也可以将需要排除的文件列表放入文件中，同时配合选项-X：
# tar -cf arch.tar * -X list

#选项-totals可以打印出归档的总字节数。注意，这是实际数据的字节数
