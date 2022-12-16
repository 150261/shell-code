# 调用方法：
# sh makePan.sh OriginalImage.jpg prefix width height xoffset yoffset 
# 清除旧数据
rm -f tmpFiles 
# 创建200张静态图片，每次移动xoffset和yoffset个像素
for o in `seq 1 200` 
 do 
 x=$[ $o+$5 ] 
 convert -extract $3x$4+$x+$6 $1 $2_$x.jpg 
 echo $2_$x.jpg >> tmpFiles 
done 
#将图片拼合成mpg视频文件
mencoder mf://@tmpFiles -mf fps=30 -ovc lavc -lavcopts \ 
 vcodec=msmpeg4v2 -noskip -o $2.mpg 
