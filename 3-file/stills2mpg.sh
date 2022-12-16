echo $* | tr ' ' '\n' >files.txt 
mencoder mf://@files.txt -mf fps=24 -ovc lavc \ 
-lavcopts vcodec=msmpeg4v2 -noskip -o movie.mpg

#./stills2mpg.sh file1.jpg file2.jpg file3.jpg ...
#./stills2mpg.sh *.jpg
