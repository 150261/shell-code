#!/bin/bash
#1970年1月1日0时0分0秒  纪元时  Unix时间
date
#打印纪元时
date +%s
#将日期转换成纪元时
date --date "Wed Dec 14 10:02:38 CST 2022" +%s
#星期几？
date --date "Dec 14 2021" +%A
#按格式打印日期
date "+%d %B %Y"
#设置时间 权限要求
date -s "21 June 2022 11:00:00"
#ntpdate也可以设置时间
#ntpdate -s www

#date的最小精度是秒  命令计时可以使用time

#date支持的格式选项
echo "date 支持的格式类型"
date +%a
date +%A
date +%b
date +%B
date +%d
date +%D
date +%y
date +%Y
date +%I
date +%H
date +%M
date +%S
date +%N


#sleep 延时

#bash -x xxx.sh  跟踪调试shell脚本
#set -x 和set +x 可以调试部分语句
#自定义调试信息 DEBUG 

#set -x 在执行时显示参数和命令
#set +x 禁止调试
#set -v 当命令进行读取时显示输入
#set +v 禁止打印输入
#`seq 0 10`

# #!/bin/bash -xv   也可以用来调试
