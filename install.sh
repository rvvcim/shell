#!/bin/sh

getdir=`cd $(dirname $0); pwd -P`
apklist=`find $getdir -maxdepth 1 -type f -name "*.apk" -print`
apknum=`ls -l | grep "**.apk$" | grep "^-" | wc -l`

echo "==== 找到 $apknum 个应用，开始安装 ===="

for apk in $apklist
do
  su -c pm install $apk
done

echo "============ 安装完成 ============"

exit