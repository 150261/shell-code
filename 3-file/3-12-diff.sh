#!/bin/bash
#diff命令可以生成两个文件之间的差异对比

#用patch命令将修补文件中包含的变更信息应用到原始文件
diff version1.txt version2.txt

#选项-u用于生成一体化输出。因为一体化输出的可读性更好 以+起始的是新加入的行，以-起始的是被删除的行
diff -u version1.txt version2.txt


diff -u version1.txt version2.txt > version.patch
#version1.txt的内容现在和version 2.txt一模一样了
# patch -p1 version1.txt < version.patch

#撤销作出的变更 -R选项不会提示y/n
#patch -p1 version1.txt < version.patch 

#diff命令也能够以递归的形式处理目录
#-N：将缺失的文件视为空文件 -a：将所有文件视为文本文件 -r：递归遍历目录下的所有文件
# diff -Naur directory1 directory2


#head 与 tail
#指定打印前几行 head -n 4 file
#打印除了最后M行之外所有的行 -M表示的是负数，并非选项
# head -n -M file

#打印除了前M行之外所有的行
#tail -n +(M+1)

#为了能够监视文件的增长，tail有一个特殊的选项-f或--follow 允许tail关注文件内容的更新并将其显示出来
#-f还可以加入一个睡眠间隔-s
dmesg | tail -f

#设置tail在指定进程结束后随之结束运行
#PID=$(pidof Foo)
#tail -f file --pid $PID

#只列出目录
#-F选项时，所有的输出项后面都会多出一个代表文件类型的字符，如@、*、| 目录对应的是/字符
ls -d */
ls -F | grep "/$"
ls -l | grep "^d" 
find . -type d -maxdepth 1 -print 

#在命令行中使用 pushd 和 popd 实现快速定位
#pushd和popd可以用于在多个目录之间切换而无需重新输入目录路径  路径栈
#pushd /var/www/

#查看栈的内容
dirs

#切换到栈中任意一个路径时，将每条路径从0编号到n
#pushd +3 

#如果要从栈中删除路径，可以使用popd
#删除最近压入的路径并切换到下一个目录  popd
#用popd +num可以从栈中移除特定的路径。num是从左到右、从0到n开始计数的

#只涉及两个位置 cd -
