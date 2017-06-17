#!/bin/bash
############################
# サーバの初期カスタマイズ
# 
# 第一引数:
#   privat 完全個人環境
#   miniy  共有miniy環境
############################

STATUS=$1
set -eu # 未定義変数をエラーにする

# バリデーション
if [ "${STATUS}" != "private" -a "${STATUS}" != "miniy" -a "x${STATUS}" != "x" ]; then
  echo "Failed"
  exit 2
fi

# sudo権限をが使えるか確認
sudo echo '-shell start-------------------------'

# /etc/motdの変更
if [ "${STATUS}" = "private" ]; then
  echo '-cp /etc/motd------------------------'
  sudo cp ~/my_setting/setting/etc/motd /etc/motd
fi

# oh-my-zshの追加
if [ ! -e ~/.oh-my-zsh/plugins ]; then
  echo '-git clone oh-my-zsh-----------------'
  mkdir -p ~/.oh-my-zsh/plugins
  git clone https://github.com/frodenas/cf-zsh-autocomplete-plugin.git ~/.oh-my-zsh/plugins/cf
fi

# anyenvの追加
if [ ! -e ~/.anyenv ]; then
  echo '-git clone anyenv-----------------'
  git clone https://github.com/riywo/anyenv  ~/.anyenv
  mkdir -p $(anyenv root)/plugins
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
fi

shopt -s dotglob

# パッケージの配布
echo '-cp start----------------------------'
#if [ ! -e ~/.ssh/config ]; then
#  mv ~/.ssh/config ~/.ssh/config_old
#fi
cp -r ~/my_setting/setting/yuhtanak/* ~/

# ディレクトリ作成
if [ ! -e ~/.memo -o ! -e ~/git/ ]; then
  echo '-mkdir start-------------------------'
fi

if [ ! -e ~/.memo ]; then
  touch ~/.memo
fi

if [ ! -e ~/git/ ]; then
  mkdir ~/git/
fi

# 権限変更
echo '-chmod start-------------------------'
sudo chmod -R 777 ~/shell/
