#!/bin/sh
# /etc/init.d/{serviceName}

### BEGIN INIT INFO
# Provides:          {id}
# Required-Start:    {(requiredStart){item} }  
# Required-Stop:     {(requiredStop){item} }
# Default-Start:     {(defaultStart){item} }
# Default-Stop:      {(defaultStop){item} }
# Short-Description: {shortDescription}
# Description:       {description}
### END INIT INFO

set -e

RUNAS=root
PIDFILE=/var/run/{id}.pid
DOTNET="/usr/bin/dotnet"

test -x $DOTNET || exit 0

start() {  
  start-stop-daemon --start \
   --background \
   --oknodo \
   --quiet \
   --user $RUNAS \
   --make-pidfile \
   --pidfile $PIDFILE \
   --exec $DOTNET \
   -- /apps/{id}}/{serviceName}.dll
}

stop() {  
  start-stop-daemon --stop \
   --oknodo \
   --quiet \
   --retry 5 \
   --name {serviceName} \
   --pidfile $PIDFILE
  
  rm -f $PIDFILE
}

status(){
  if [ -f $PIDFILE ]; then
      PID="$(cat $PIDFILE)"
      if kill -0 $PID &>/dev/null; then
          echo "Service is running with pid $(cat "$PIDFILE")"
          exit 0
      fi
  fi

  echo "Service is not running"
  exit 1;
}

uninstall() {
  stop
  rm -f "$PIDFILE"
  update-rc.d -f {serviceName} remove
  rm -fv "$0"
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  status)
    status
    ;;
  uninstall)
    uninstall
    ;;
  *)
    echo "Usage: $0 {start|stop|status|uninstall}"
    exit 1
esac

exit $?