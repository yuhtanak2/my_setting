#!/bin/bash
###############################################
# Organizationに紐づくりリポジトリ一覧の取得
###############################################
# 引数
# $1 Organization 
# $2 オプション:出力モード(ssh or http)
###############################################

ORGANIZATION_NAME=$1
OUTPUT_MODE=$2

#Organizationの指定
if [ "x${ORGANIZATION_NAME}" = "x" ]; then
  echo "Input Failed"
  exit 2
fi

#SSH出力モード
if [ "${OUTPUT_MODE}" = "ssh" ]; then
  for i in {1..10}
  do 
    curl https://github.com/${ORGANIZATION_NAME} -X GET -d "page=${i}&tab=repositories" 
  done \
  | grep codeRepository \
  | sed -e 's/^ *//' \
  | awk '{print $2}' \
  | sed -e "s/href=\"\//git@github.com:/" \
  | sed -e "s/\"/.git/" | sort | uniq > repository_list.txt 

#HTTP出力モード
elif [ "${OUTPUT_MODE}" = "http" ]; then
  for i in {1..10}
  do
    curl https://github.com/${ORGANIZATION_NAME} -X GET -d "page=${i}&tab=repositories"
  done \
  | grep codeRepository \
  | sed -e 's/^ *//' \
  | awk '{print $2}' \
  | sed -e "s/href=\"/https:\/\/github.com/" \
  | sed -e "s/\"/.git/" | sort | uniq > repository_list.txt
  
#モードの指定なし
else
  for i in {1..10}
  do
    curl https://github.com/${ORGANIZATION_NAME} -X GET -d "page=${i}&tab=repositories"
  done \
  | grep codeRepository \
  | sed -e 's/^ *//' \
  | awk '{print $2}' \
  | sed -e "s/href=\"\/${ORGANIZATION_NAME}\///" \
  | sed -e "s/\"//" | sort | uniq > repository_list.txt
fi

#ファイルの出力
cat repository_list.txt && rm repository_list.txt
