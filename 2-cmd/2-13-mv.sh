#!/bin/bash
#rename命令利用Perl正则表达式修改文件名
rename *.JPG *.jpg

#将文件名中的空格替换成字符 "_"
#'s/ /_/g'用于替换文件名，而 * 是用于匹配目标文件的通配符
#rename 's/ /_/g' * 

#转换文件名的大小写
#rename 'y/A-Z/a-z/' * 
#rename 'y/a-z/A-Z/' *

#将所有的.mp3文件移入给定的目录
# find path -type f -name "*.mp3" -exec mv {} target_dir \;

#以递归的方式将所有文件名中的空格替换为字符"_"
# find path -type f -exec rename 's/ /_/g' {} \;

#拼写检查与词典操作  目录/usr/share/dict/
#“词典文件”就是包含了单词列表的文本文件。我们可以利用它来检查某个单词是否在词典之中。
#在grep中，^标记着单词的开始，$标记着单词的结束①，-q选项 禁止grep产生任何输出
#^匹配的是行首位置，$匹配的是行尾位置

#拼写检查命令aspell
#look命令可以显示出以特定字符串起始的行
#你可以用它在日志文件中查找以特定日期为首的记录，或是在词典中查找以特定字符串开头的单词
#look默认会搜索/usr/share/dict/words
#grep "^word" filepath
look word
look 'Aug 30' /var/log/syslog 
