#!/bin/bash
#交互输入自动化
#交互式输入的顺序 notes[Return]docx[Return] 

#echo -e来生成输入序列
#如果输入内容比较多 可以用单独的输入文件结合重定向操作符来提供输入

#缓冲区溢出攻击
#十六进制形式的shellcode进行重定向 重定向到有缺陷的可执行文件中
#echo -e "\xeb\x1a\x5e\x31\xc0\x88\x46" 

#echo命令和重定向可以实现交互式输入的自动化
#但没有经过验证 容易出现问题

#expect程序能够执行复杂的交互操作并适应目标应用的变化
#该程序在世界范围内被广泛用于控制硬件测试、验证软件构建、查询路由器统计信息等

#expect是一个和shell类似的解释器。它基于TCL语言 在linux下需要手动进行安装
#expect 的3个主要命令：
#spawn  运行新的目标应用
#expect 关注目标应用发送的模式 接受一组模式以及匹配模式时要执行的操作。操作需要放入花括号中
#send 向目标应用发送字符串 。和echo -n -e类似，send不会自动添加换行符，也能理解转义字符


#并行进程加速命令执行
#md5sum属于CPU密集型命令

#Bash的操作符&，它使得shell将命令置于后台并继续执行脚本   循环结束，但进程仍然在后台运行
#$!来获得进程的PID   wait命令等待这些进程结束

#换页操作（swapping) 会拖慢执行速度
#GNU parallel命令  能够优化资源使用，避免系统超载
sudo apt install parallel
#ls *jpg | parallel convert {} -geometry 50x50 {.}Small.jpg

#查找放错地方的文件并整理凌乱的文件层次结构
#一种方法是将目录层次以树状形式显示出来
#另一种方法是生成目录下所有文件和子目录的汇总信息

#树状视图
#第一个tr删除了所有的字母数字字符、连字符（-）、下划线（_）和点号（.）， 只将路径中的斜线（/）传入第二个tr
#后者将这些斜线全部转换成空格  利用basename命令去掉文件名前的路径部分并将结果显示出来
find . -exec sh -c 'echo -n {} | tr -d "[:alnum:]_.\-" | tr "/" " "; basename {}' \;

# 生成文件及子目录的汇总信息
