#!/bin/bash
LOG="/var/log/srv-health.log"
HOSTNAME=$(hostname)
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

if [[ "$HOSTNAME" =~ ^srv-app01 ]]; then
    if curl -sf http://localhost:8080 > /dev/null 2>&1; then
        echo "$TIMESTAMP - $HOSTNAME - HTTP: OK" >> "$LOG"
    else
        echo "$TIMESTAMP - $HOSTNAME - HTTP: FAILED" >> "$LOG"
    fi
fi

if [[ $HOSTNAME =~ ^srv-app02 ]]; then
    if curl -sf http://localhost > /dev/null 2>&1; then
      echo "$TIMESTAMP - $HOSTNAME - httpd: OK" >> "$LOG"
  else
      echo "$TIMESTAMP - $HOSTNAME - httpd: FAILED" >> "$LOG"
  fi
fi
