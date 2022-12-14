#!/bin/bash
#shell数学运算 let (()) [] 基本的计算操作
#工具expr和bc可以执行高级操作
#使用let时，变量名前不需要再添加$
#操作符[]的使用方法和let一样 []中可以加上$前缀
num1=1
num2=5
let result=num1+num2
echo $result
let result++
echo $result

let result+=10
echo $result

res=$[result+num2]
echo res=$res
res=$[$num1+result]
echo res=$res

#出现在(())中的变量名之前需要加上$
sum=$(($res+$result))
echo sum=$sum
sum=$((sum+1))
echo sum=$sum

#expr
exp=`expr 3 + 4`
echo exp=$exp
exp=$(expr $sum + 5)
echo exp=$exp

#以上方法不支持浮点数，只支持整数运算

#bc用于数学运算的高级实用工具
#bc接受操作控制前缀
echo "4 * 0.56" | bc
no=54;
rebc=`echo "$no * 1.5" | bc`
echo $rebc

#设定小数精度
echo "scale=2;22/7" | bc
#进制转换
no=100
echo "obase=2;$no" | bc
no=1111111
echo "obase=10;ibase=2;$no" | bc

#计算平方以及平方根
echo "sqrt(25)" | bc #Square root
echo "2^10" | bc #Square
