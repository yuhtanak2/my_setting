# .bashrc
########################################
export LESSCHARSET=utf-8

case ${OSTYPE} in
    darwin*)
    # Mac用の設定
        export CLICOLOR=1
        alias ls='ls -F -G'
        alias ll='ls -alF -G'
        ;;
    linux*)
        # Linux用の設定
        alias ls='ls -F --color=auto'
        alias ll='ls -alF --color=auto'
        ;;
esac

# プロンプト
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (git)-[\1]/'
}
function promps {
    # 色は気分で変えたいかもしれないので変す宣言しておく
    local  BLUE="\[\e[1;34m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[1;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[1;37m\]"
    local  YELLOW="\[\e[1;33m\]"

    local BASE="${BLUE}\u${WHITE}@${GREEN}\h"
    PS1="[\[${BASE}${WHITE}:\w]${GREEN}\$(parse_git_branch)\\n${WHITE}$ "
}
promps

