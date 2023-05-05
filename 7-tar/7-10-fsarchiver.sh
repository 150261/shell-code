#/bin/bash
#使用 fsarchiver 创建全盘镜像
#创建文件系统/分区备份
#fsarchiver savefs backup.fsa /dev/sda1

#使用savefs选项，将多个分区作为fsarchiver最后的参数

#使用fsarchiver的restfs选项从备份归档中恢复分区
#fsarchiver restfs backup.fsa id=0,dest=/dev/sda1 

#id=0表明我们希望从备份归档中提取第一个分区的内容
