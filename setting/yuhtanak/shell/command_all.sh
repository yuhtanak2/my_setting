#!/bin/bash
###############################################
# commandを一斉実行
###############################################

IFS_BACKUP=$IFS
IFS=$'\n'

COMMAND=$@
if [ "x${COMMAND}" = "x" ]; then
    echo "Failed"
    exit 2
fi

for i in `ls -F | grep / `
do
IFS=$IFS_BACKUP
  echo '---------------------------------'
  cd "${i}"
  ${COMMAND}
  cd ..
  echo '---------------------------------'
done
