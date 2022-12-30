#!/bin/bash
#命令行下载工具
#wget是一个用于文件下载的命令行工具
#wget URL1 URL2 URL3 .. 

#选项-O指定输出文件名。如果存在同名文件，那么该文件会被下载文件所取代
#wget http://www.knopper.net -O knopper.html

#选项-o指定一个日志文件
#wget ftp://ftp.example.com/somefile.img -O dloaded_file.img -o log 

#选项-t可以指定在放弃下载之前尝试多少次
#将-t选项的值设为0会强制wget不断地进行重试：
#wget -t 5 URL 

#选项--limit-rate可以限定下载任务能够占有的最大带宽 用k（千字节）和m（兆字节）指定速度限制
#选项--quota或-Q可以指定最大下载配额（quota）。配额一旦用尽，下载随之停止
#利用选项-c从断点开始继续下载


#选项--mirror wget像爬虫一样以递归的方式遍历网页上所有的URL链接，并逐个下载
#wget --mirror --convert-links exampledomain.com

#-N表示使用文件的时间戳 -k或--convert-links指示wget将页面的链接地址转换为本地地址
#wget -r -N -l -k DEPTH URL

#需要HTTP或FTP认证，可以用--user和--password提供认证信息
#在网页上手动输入密码 --ask-password。

#Lynx是一款基 于命令行的Web浏览器，能够以纯文本形式下载Web网页
#lynx命令

#选项-dump能够以纯ASCII编码的形式下载Web页面

#cURL可以使用HTTP、HTTPS、FTP协议在客户端与服务器之间传递数据
#选项-O指明将下载数据写入文件，采用从URL中解析出的文件名
#url 是完整的，不能仅是站点的域名

#选项-o可以指定输出文件名。如果使用了该选项，只需要写明站点的域名就可以下载

#选项--silent可以让curl命令不显示进度信息
#如果需要在下载过程中显示形如#的进度条，可以使用选项--progress

#cURL能够从特定的文件偏移处继续下载
#偏移量是以字节为单位的整数。如果只是想断点续传，那么cURL不需要指定准确的字节偏移。
#curl URL/file -C offset
# curl -C - URL 

#curl命令的 --referer选项指定参照页字符串
# curl --referer Referer_URL target_URL 

#选项--cookieCOOKIE_IDENTIFER可以指定提供哪些cookie。cookies需要以name=value的形式来给出。多个cookie之间使用分号分隔：
# curl http://example.com --cookie "user=username;pass=hack"

#选项--cookie-jar可以将cookie另存为文件
#cURL的选项--user-agent或-A用于设置用户代理
#curl URL --user-agent "Mozilla/5.0"
#

#cURL也能够发送其他HTTP头部信息。使用-H "Header"传递多个头部信息
#curl -H "Host: www.knopper.net" -H "Accept-language: en" URL

#用--limit-rate限制cURL的下载速度 单位：用k（千字节）和m（兆字节）
# curl URL --limit-rate 20k

#--max-filesize选项指定可下载的最大文件大小
#curl URL --max-filesize bytes
#如果文件大小超出限制，命令返回一个非0的退出码


#curl的选项-u完成HTTP或FTP认证
#curl -u user:pass http://test_auth.com 

#选项-I或--head可以只打印HTTP头部信息
