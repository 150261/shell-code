#!/bin/bash
#创建特定大小的文件最简单的方法就是利用dd命令
#dd命令会克隆给定的输入内容 将一模一样的一份副本写入到输出
#stdin、设备文件、普通文件等都可作为输入  
#stdout、设备文件、普通文件等也可作为输出
#bs指定了以字节为单位的块大小（block size  count表示需要被复制的块数
#dd if=/dev/zero of=junk.data bs=1M count=1 


#文本文件的交集与差集
#comm命令可用于比较两个已排序的文件
#显示出文件所独有的行 和  这两个文件所共有的行
#交集  求差  差集
sort A.txt -o A.txt ; sort B.txt -o B.txt
comm A.txt  B.txt
#-1选项可以删除第1列 以此类推

#comm 字符-作为命令行参数，借此实现从stdin中读取输入
sort B.txt C.txt | comm - A.txt
#查找并删除重复文件


#awk
#创建一些测试文件
#awkecho "next" > other.txt; echo "hello" > test ; cp test test_copy1 ; cp test test_copy2;
#ls -lS对当前目录下的所有文件按照文件大小进行排序并列出文件的详细信息
#--time-style=long-iso告诉ls依照ISO格式打印日期
#awk的BEGIN{}语句块。该语句块读取文件所有的行并初始化变量
#getline读取该行 读入一行后，该行就被保存在$0中，行中的每一列分别被保存在$1、$2…$n中
#tee可以将文件名传给rm命令并输出。tee可以将输出发送至stdout和另一个文件中。

#文件权限、所有权与粘滞位
#三组权限打交道（用户、用户组以及其他用户权限）
#用户还有一个称为setuid（S）的特殊权限 setuid权限允许可执行文件以其拥有者的权限来执行
#目录有一个叫作粘滞位（sticky bit）的特殊权限。如果目录设置了粘滞位，只有创建该目录的用户才能删除目录中的文件
#粘滞位出现在其他用户权限组中的执行权限（x）位置。它使用t或T来表示
#如果没有设置执行权限，但设置了粘滞位，就使用T；如果同时设置了执行权限和粘滞位，就使用t。

#chmod命令设置文件权限
#chmod u=rwx g=rw o=r filename
#以用+为用户、用户组和其他用户添加权限，用-取消权限

#给所有权限类别（即用户、用户组和其他用户）添加可执行权限
#chmod a+x filename

#权限也可以使用3位八进制数来表示，每一位按顺序分别对应用户、用户组和其他用户

#使用chown命令更改文件或目录的所有权
#chown user:group filename 
#用chown命令的-R能够以递归的方式设置所有权

#设置粘滞位后，只有目录的所有者才能够删除目录中的文件
# chmod a+t directory_name

#以递归方式设置文件权限
#chmod 777 . -R

#以不同的身份运行可执行文件（setuid）
#setuid只能应用在Linux ELF格式的二进制文件上 不能对脚本设置setuid
#首先将文件的所有权更改为需要执行该文件的用户，然后以该用户的身份登录
#chmod +s executable_file 
# chown root:root executable_file 

#将文件设置为不可修改
#拓展文件系统 ext2 ext3 ext4 支持其他属性  
#其中一种扩展属性就是可以设置不可修改的文件
#以利用命令df -T或是通过查看 /etc/mtab文件来确定文件系统的类型
#/etc/mtab文件的第一列指定了分区设备路径（例如/dev/sda5），第三列指定文件系统类型

#chattr命令可用于更改扩展属性。它能够将文件设置为不可修改，也可以修改其他属性来调节文件系统同步或压缩率

#chatter将文件设置为不可修改：
# chattr +i file 

#脚本在应用于实际系统之前必须经过测试
#touch命令可以用来生成空白文件或是修改已有文件的时间戳
#可能需要生成大量文件来验证是否存在内存泄漏或是进程挂起等问题

#调用touch命令并使用一个不存在的文件名作为参数，创建空白文件：
#touch filename
#如果文件已经存在，那么touch命令会将与该文件相关的所有时间戳都更改为当前时间
#只想更改某些时间戳
#touch -a 只更改文件访问时间
#touch -m 只更改文件修改时间

#指定特定的时间和日期
#touch -d "Fri Jun 25 20:50:14 IST 1999" filename 



#ardtypeo#

