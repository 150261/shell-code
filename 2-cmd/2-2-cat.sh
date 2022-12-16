#!/bin/bash
#打印多个文件的内容
#cat file1 file2
#man cat

#去除多余的空白行 压缩成单独的一行
#cat -s file

#将制表符标志为^I
#cat -T file

#显示行号（包括空白行） -b 忽略空白行
#cat -n file


#录制并回放终端会话
#script   scriptreplay
#script -t 2> timing.log -a output.session
#tclsh
#puts [ expr 2 + 2 ]
#exit

#scriptreplay timing.log output.session
#不知道为什么没有回放

#find 查找并列出文件
# find base-path
find .
#find . -print  使用换行符分割输出
#使用\0分割输出
find . -print0

#通配符和正则表达式
find . -name "*.txt"
find . -name *.txt

#单引号防止扩展
find . -name '*.txt'

#忽略字母大小写
find . -iname debug.sh

#支持逻辑操作符
#-a -and   逻辑与
#-o -or    逻辑或
find . \( -name '*.txt' -o -name '*.pdf' \) -print
#-path 选项可以限制所匹配文件的路径及名称 -regex 作用类似  但是是基于正则表达式 
find . -regex '.*\(\.txt\|\.log\)$'
#-iregex 忽略大小写
find . -iregex '.*\(\.txt\|\.log\)$'

#! 排除匹配到的模式
find . ! -name "*.txt" -print

#基于目录深度的搜索 防止碰上指向本身的链接 容易陷入死循环
#目录深度放越早  效率越高
#-L 跟随符号链接
find -L /proc/ -maxdepth 2 -name "bundlemaker.def" 2> /dev/null
#开始查找的最小目录深度 深度至少为n
find -L . -mindepth 1 -name "*.txt" 2> /dev/null

#根据类型寻找 -type
# f l d  c b s p
#s 套接字  p FIFO
find . -type f -print

#根据文件的时间戳进行搜索
#-atime 最近一次访问文件的时间
#-mtime 最后一次被修改的时间
#-ctime 文件元数据 权限和所有权最后一次被修改的时间
#以天为单位来计时
#unix 不保存文件的创建时间 - 小于 + 大于
find . -type f -atime 7 -print

#以分钟计时 -amin -cmin -mmin
#找出比file.txt修改时间更近的文件 -newer选项可以指定一个用于比较修改时间的参考文件
find . -type f  -newer timing.log  -print

#文件大小  -size  文件大小单位 b c w k M  G
find . -type f -size +2k

#文件权限和所有权
#-perm列出特定权限
find . -type f -perm 644 -print

#-user USER   某个特定用户拥有的文件

#-delete 删除匹配到的文件
#-exec 执行命令
#\ 转义字符  + 可以作为命令的结尾 ;
#find . -type f -user root -exec chown slynux {} \;
#-exec 只能接收单个命令  但是可以将多个命令写到shell脚本中  -exec可以执行脚本

#-prune选项跳过特定的目录
#跳过.git目录
#find . -name ".git" -prune
