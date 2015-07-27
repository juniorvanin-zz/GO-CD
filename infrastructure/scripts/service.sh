#!/bin/sh
### BEGIN INIT INFO
# Provides:          registrolivre
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# X-Interactive:     true
# Short-Description: Start/stop registrolivre server
### END INIT INFO

case $1 in
    start)
        echo "Starting registrolivre..."
        if [ ! -f /home/vagrant/app/pid ]; then
            nohup java -Dserver.port=8088 -jar /home/vagrant/app/registrolivre.jar /home/vagrant/app 2>> /home/vagrant/app/logs.txt >> /home/vagrant/app/logs.txt &
            echo $! > /home/vagrant/app/pid
            echo "registrolivre started ..."
        else
            echo "registrolivre is already running ..."
        fi
    ;;
    stop)
        if [ -f /home/vagrant/app/pid ]; then
            PID=$(cat /home/vagrant/app/pid);
            echo "Stopping registrolivre..."
            kill $PID;
            echo "registrolivre stopped ..."
            rm /home/vagrant/app/pid
        else
            echo "registrolivre is not running ..."
        fi
    ;;
    restart)
        if [ -f /home/vagrant/app/pid ]; then
            PID=$(cat /home/vagrant/app/pid);
            echo "Stopping registrolivre...";
            kill $PID;
            echo "registrolivre stopped ...";
            rm /home/vagrant/app/pid

            echo "Starting registrolivre..."
            nohup java -Dserver.port=8088 -jar /home/vagrant/app/registrolivre.jar /home/vagrant/app 2>> /home/vagrant/app/logs.txt >> /home/vagrant/app/logs.txt &
            echo $! > /home/vagrant/app/pid
            echo "registrolivre started ..."
        else
            echo "registrolivre is not running ..."
        fi
    ;;
esac
