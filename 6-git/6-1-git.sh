#!/bin/bash
#Git和Fossil

#gitinit命令会在当前工作目录下创建子目录.git并初始化git配置文件

#远程用户也能够访问这个仓库，需要使用update-server-info命令
#git update-server-info 

#git clone命令可以将文件从远程站点复制到本地系统中

#git add命令可以将工作代码（working code）中的变更添加到暂存区

#git commit命令可以将变更提交至仓库

#git commit命令会打开shell环境变量EDITOR中定义好的编辑器

#可以利用-a和-m选项缩短add/commit操作的输入
#-a：在提交前加入新的代码
#-m：指定一条信息，不进入编辑器

#git的checkout子命令可用于更改及创建新分支
#切换到之前创建的分支
#git checkout OldBranchName

#注意，如果你在当前工作区（workspace）中尚有未提交的变更，则无法切换到其他已有的分支

#以使用checkout的选项-b来创建新的分支

#git branch命令可以查看分支

#git merge命令将变更合并入新分支：

#如果合并完分支之后不再需要该分支，可以使用选项-d进行删除

#format-patch命令会汇集你所作出的变更，创建一个或多个补丁文件
#补丁文件名由数字、描述以及.patch组成
# git format-patch master 

#使用git log命令查看仓库中所有提交的日志

#使用SHA1作为参数的git format-patch命令形式如下
#git format-patch SHA1

#可以根据与当前位置的距离来标识某个快照，这可以通过选项-#来实现
#git format-patch -1 master 

#下列命令会为bleedingEdge分支上最近的两次变更生成补丁文件
#git format-patch -2 bleedingEdge 


#git apply命令可以将补丁应用于工作代码
#选项--check可以测试补丁是否有效

#git push命令可以将分支推送到主线
# git push origin MyBranchName

#get fetch和git pull命令可以将数据从远程下载到本地仓库
#get fetch Username@Address:Project

#git pull命令会获取并合并变更到工作代码
#git pull Username@Address:Project

#git status命令会输出项目的当前状态 它会告诉你当前所处分支、是否有未提交的变更以及是否与origin仓库①保持同步

#git log命令所生成的报告中包括SHA1 ID、提交快照的作者、提交日期以及日志信息

#git blame命令就可以找出是谁提交了这段代码以及对应的SHA
#git blame命令可以返回一个列表，其中包含提交的SHA、作者、提交日期以及提交信息的第一行

#用git bisect命令找出引发问题的提交。

#bisect命令会找到位于好代码和坏代码之间的中间提交点以供测试

#git标签仅在本地范围内有效
#git push默认不会推送标签。要想把标签发送到origin仓库，必须加上选项--tags：
#git push origin --tags
#git tag命令包括可以用于添加、删除和列出标签的选项
#选项-a可以为标签加入注解 使用-m选项定义信息

#git show命令
#选项-d可以删除标签
