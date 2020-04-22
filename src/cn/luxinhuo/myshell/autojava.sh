#!/usr/bin/env bash

SHELL_NAME=autojava.sh
PROJECT_FILE=/root/init/test.jar
LOG_FILE=/root/init/test.log
JAR_NAME=test.jar
PORT=8080


function getPID() {
  javaps=$(jps -l | grep "${JAR_NAME}")
  if [[ -n $javaps ]]; then
    PID=$(echo "$javaps" | awk '{print $1}')
  else
    PID=0
  fi
}

function checkPortStatus() {
    portStatus=$(lsof -nP -iTCP:"${PORT}" -sTCP:LISTEN | wc -l)
    HTTP_PORT_STATUS=0
    if [[ -n "${portStatus}" ]]; then
        HTTP_PORT_STATUS=$(echo "$portStatus" | awk '{print $1}')
    fi
}

function start() {

  JAVA_OPS=""
  getPID
  if [[ ${PID} -ne 0 ]]; then
      echo "${JAR_NAME} already started(PID =${PID})"
  else
      echo "Starting ${JAR_NAME}"

      checkPortStatus
      if [[ ${HTTP_PORT_STATUS} -ne 0 ]]; then
          echo "${PORT} has been used"
          exit
      fi

      nohup java "$JAVA_OPS" -jar "${PROJECT_FILE}" > "$LOG_FILE" 2>&1 &
      for (( i = 0; i < 100; i++ )); do
          sleep 1
          getPID
          checkPortStatus
          if [[ "$PID" -ne 0 ]] && [[ ${HTTP_PORT_STATUS} -ne 0 ]]; then
              echo "start success,PID=$PID"
              exit
          fi
      done
      echo "start failed"
  fi
}

function stop() {
    getPID
    if [ ${PID} -ne 0 ]; then
        echo "Stoping $JAR_NAME"

        if ! kill ${PID} ; then
          echo "failed"
          exit 1
        fi

        for (( i = 0; i < 10; i++ )); do
            sleep 1
            getPID
            checkPortStatus
            if [[ $PID -eq 0 ]] && [[ ${HTTP_PORT_STATUS} -eq 0 ]]; then
                break
            fi
        done

        getPID
        if [ ${PID} -eq 0 ]; then
            echo "success"

        else
            kill -9 ${PID}
            if [ ${PID} -ne 0 ]; then
                echo "failed"
                exit
            fi
            echo "some task is running in background, force stop , success!"
        fi

    else
        echo "$JAR_NAME is not running"
    fi
}

function restart() {
    stop
    sleep 1
    start
}

function getServerStatus() {
    getPID
    checkPortStatus
    if [[ "$PID" -ne 0 ]] && [[ ${HTTP_PORT_STATUS} -ne 0 ]]; then
          echo "$JAR_NAME is Running,PID=$PID"
    else
          echo "$JAR_NAME is not Running"
    fi
}

case "$1" in
start)
    start
    ;;
stop)
    stop
    ;;
restart)
    restart
    ;;
status)
    getServerStatus
    ;;
*)
    echo "usage: ${SHELL_NAME} {start|stop|restart|status}"
esac