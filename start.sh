#!/bin/sh
export JAVA_HOME=/usr/java/jdk1.8.0_131
export PATH=$JAVA_HOME/bin:$PATH


APPDIR=`pwd`
PIDFILE=$APPDIR/loan-plat-server1.pid
if [ -f "$PIDFILE" ] && kill -0 $(cat "$PIDFILE"); then
echo "loan-plat-server1 is already running..."
exit 1
fi
nohup java -jar loan-plat-server1.jar --spring.profiles.active=prod >/dev/null 2>&1 &
echo $! > $PIDFILE
echo "start loan-plat-server1 success..."
