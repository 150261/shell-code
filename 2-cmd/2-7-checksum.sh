#!/bin/bash
#校验与核实
#校验和验证数据完整性
#多种校验程序和算法 常用MD5和SHA-1
md5sum *.txt
#md5deep sha1deep 遍历目录树 可能需要下载 -r 递归  -l 相对路径
md5deep -rl ../2-cmd/ > 2-cmd.md5

#比较校验和是否匹配 
md5sum -c 2-cmd.md5

#SHA-1算法
echo "SHA-1"
sha1sum *

#以上两种算法为单向散列算法 无法逆推出原始数据 存在安全隐患 可以使用更新的算法
#shadow-like散列  加盐散列
#生成密码的加盐散列
openssl passwd -1 -salt SALT_STRING PASSWORD


#加密工具与散列 可以无损的重构原始数据
#linux 常用的加密工具和算法  crypt gpg base64
#crypt 简单的加密工具
#gpg(GNU privacy guard, GNU隐私保护)  加密和解密
gpg -c ex.txt
gpg ex.txt.gpg

#Base64 将2进制转换为64 基数的形式  email传输二进制数据
#base64 编码、解码base64字符串
#base64 file > outputfile
#cat file | base64 > outputfile
#解码
#base64 -d file > output
#cat base64_file | base64 -d > outputfile
