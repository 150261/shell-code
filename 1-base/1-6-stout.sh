#!/bin/bash
#stdin:0-标准输入  stdout:1-标准输出  sterr:2-标准错误
echo "This is a log text " > log.txt
echo "Helloi!"  >> log.txt
cat log.txt

#命令发生错误,会返回1个非0的退出状态，退出状态可以从特殊变量$?获取
#1> 中间不能有空格
ls + > out.log
echo $?
ls + 2> out.log
2>stderr.txt 1>stdout.txt

#stderr转换成为stdout,使得两者重定向到同一个文件中
#cmd 2>&1 alloutput.txt
&> output.txt

#stderr的输出可以重定向到/dev/null
chmod 000 output.txt
cat output.txt 2> err.txt
cat err.txt

#数据重定向到文件，还可以提供重定向数据副本作为管道中后续命令的stdin
#command | tee file1 file2 | othercommand

cat log.txt | tee out.txt  | cat -n
#默认情况下 tee命令会将文件覆盖 使用-a选项可用于追加内容
cat log.txt | tee -a out.txt  | cat -n

#发送输入内容的两份副本给stdout，使用-作为命令的文件名参数
#cmd1 | cmd2 | cmd -
echo who is the women | tee -

#重定向操作针对标准输出 想使用特定的文件描述符，将描述符编号置于操作符之前
#/dev/stdin  /dev/stdout  /dev/stderr
#/dev/null 特殊的设备文件 黑洞

#借助< 可以像使用stdin那样从文件中读取数据
#cmd < file

#重定向脚本内部的文本块
cat <<EOF>log.txt
This is a generated file. Do not edit. Changes will be overwrite!
EOF

#exec命令 自定义文件描述符
#创建用于读取文件的文件描述符
echo "this is a test txt" > input.txt
exec 3<input.txt
cat<&3
#再次读取就不能继续使用文件描述符3，而是需要用exec重新创建新的文件描述符

#创建用于写入的文件描述符号
exec 4>out.txt
echo neline >&4
cat out.txt

#创建用于写入 追加模式的文件描述符
exec 5>>input.txt
echo appended line >&5
cat input.txt
