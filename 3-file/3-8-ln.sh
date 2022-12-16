#!/bin/bash
#查找符号链接及其指向目标

#创建符号链接
#ln -s target symbolic_link_name 
#ln -l -s /var/www/ ~/web
#验证链接是否已建立 ls -l web

#使用readlink打印出符号链接所指向的目标路径  readlink web


#Unix/Linux系统使用file命令，通过检查文件内容来确定其类型
#打印文件类型信息
file /etc/passwd 
#打印不包括文件名在内的文件类型信息
#file命令能够提供很多细节信息，比如图像编码以及分辨率（如果是图像文件的话）。
#file -b filename 

#环回文件
#在大小为1GB的文件中创建ext4文件系统
#dd if=/dev/zero of=loobackfile.img bs=1G count=1 
#mkfs.ext4 loopbackfile.img
#file loobackfile.img
#mkdir /mnt/loopback
# mount -o loop loopbackfile.img /mnt/loopback 

#指定具体的环回设备
#losetup /dev/loop1 loopbackfile.img 

#fdisk 创建分区
#losetup /dev/loop1 loopback.img
#fdisk /dev/loop1
#在loopback.img中创建分区并挂载第一个分区 -o用来指定偏移量
#losetup -o 32256 /dev/loop2 loopback.img

#快速挂载带有分区的环回磁盘镜像
#kpartx 可以挂载镜像中的所有分区  需要安装
#命令在磁盘镜像的分区与/dev/mapper中的设备之间建立了映射 便可以挂载这些设备
#kpartx -v -a diskimage.img
#完成设备上的操作后（并使用umount卸载所有挂载过的分区），使用下列命令移除映射
#kpartx -d diskimage.img

#可以用一个非空目录作为挂载路径。在设备被卸载之前，这个挂载路径中包含的都是来自该设备的数据，而非目录中的原始内容
#mount -o loop linux.iso /mnt/iso 

#对挂载设备作出的更改并不会被立即写入物理设备。只有当内部缓冲区被写满之后才会回写设备
#sync命令强制立刻写入更改

#可引导光盘和不可引导光盘

# dd if=/dev/cdrom of=image.iso
#mkisofs命令可以创建ISO镜像文件。该命令生成的输出文件能够被cdrecord这类实用工具 刻录到CD-ROM或DVD-ROM
#-V 指定了ISO文件的卷标
#mkisofs -V "Label" -o image.iso source_dir/


#能够启动闪存或硬盘的混合型ISO 
#isohybrid命令把标准ISO文件转换成混合ISO 可以使用yum或apt-get获取syslinux-utils

#制作出可引导的ISO文件  isohybrid image.iso 
#该ISO写入USB存储设备   dd if=image.iso of=/dev/sdb1

#命令行刻录ISO
#cdrecord命令可以将ISO文件刻入CD-ROM或DVD-ROM
#-speed选项指定刻录速度 多区段刻录需要使用-multi选项

#eject 可以弹出光驱托盘 -t 选项合上光驱托盘
#cdrecord -v dev=/dev/cdrom image.iso
