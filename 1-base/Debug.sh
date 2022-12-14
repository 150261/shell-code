#!/bin/bash
function DEBUG()
{
	[ "$_DEBUG" == "on" ] && $@ || :
}
for i in {1..10}
do
	DEBUG echo "I is $i"
done

#_DEBUG=on ./debug,sh
#命令: 告诉shell不要进行任何操作
