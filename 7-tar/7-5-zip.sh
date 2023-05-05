#!/bin/bash
#创建zip格式的压缩归档文件
#zip file.zip file

#选项-f可以对目录进行递归式归档：
#zip -r archive.zip folder1 folder2 


#unzip file.zip 

#选项-u可以更新压缩归档文件中的内容
# zip file.zip -u newfile 

# 选项-d从压缩归档文件中删除一个或多个文件
# zip -d arc.zip file.txt

#选项-l可以列出压缩归档文件中的内容
#unzip -l archive.zip 


#pbzip2、plzip、pigz和lrzip命令都采用了多线程

#sudo apt-get install pbzip2 

#压缩单个文件
#pbzip2 myfile.tar

#压缩并归档多个文件或目录
#tar cf sav.tar.bz2 --use-compress-prog=pbzip2 dir 
#tar -c directory_to_compress/ | pbzip2 -c > myfile.tar.bz2 

#选项-d可以解压缩
#pbzip2 -d myfile.tar.bz2
#pbzip2 -dc myfile.tar.bz2 | tar x

#pbzip2在内部使用的压缩算法和bzip2一样，但是它会利用pthreads（一个线程库）来同时压缩多个数据块
#pbzip2的-p选项可以手动指定处理器核心的数量
#pbzip2 -p4 myfile.tar

#从选项-1到-9可以指定最快到最好的压缩效果，其中-1的压缩速度最快，-9的压缩率最高

#squashfs程序能够创建出一种具有超高压缩率的只读型文件系统。它能够将2GB~3GB的数据压缩成一个700MB的文件


# sudo apt-get install squashfs-tools 

#) 使用mksquashfs命令添加源目录和文件，创建一个squashfs文件
#mksquashfs SOURCES compressedfs.squashfs

#利用环回形式挂载squashfs文件：
# mount -o loop compressedfs.squashfs /mnt/squash 

#选项-e可以排除部分文件和目录
#也可以将需要排除的文件名列表写入文件，然后用选项-ef指定该文件
# sudo mksquashfs /etc test.squashfs -ef excludelist

#如果希望在排除文件列表中使用通配符，需要使用-wildcard选项。


#rsync可以在最小化数据传输量同时，同步不同位置上的文件和目录
#相较于cp命令，rsync的优势在于比较文件修改日期，仅复制较新的文件

# 将源目录复制到目的路径：
#rsync -av source_path destination_path

#-a表示进行归档操作

#-v（verbose）表示在stdout上打印出细节信息或进度。

#源路径和目的路既可以是远程路径，也可以是本地路径

#要想保持两端的数据同步，需要定期运行同样的rsync命令。它只会复制更改过的文件

#的选项-z指定在传输时压缩数据

#将一个目录中的内容同步到另一个目录 不包括目录本身
# rsync -av /home/test/ /home/backups

#包括目录本身在内
# rsync -av /home/test /home/backups

#选项-r强制rsync以递归方式复制目录中所有的内容

#本地路径和远程路径形式

#选项--exclude和--exclude-from可以指定不需要传输的文件：

#rsync的--delete选项 删除那些在源端已不存在的文件

#差异化备份
