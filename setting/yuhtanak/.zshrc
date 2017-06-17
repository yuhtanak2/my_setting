# .zshrc
########################################
# 環境変数（文字コード）
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# エディタ
export "EDITOR=vim"

# 色を使用出来るようにする
autoload -Uz colors
colors

# lsコマンドとzsh補完候補の色をそろえる
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias gls="gls --color"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

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

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 全履歴表示
function history-all { history -E 1 }

#履歴を複数端末で共有する
setopt share_history

# プロンプト
PROMPT='[%F{blue}%B%n%b%f@%F{green}%U%m%u%f:%~] 
$ '
RPROMPT='[%F{magenta}%d%f]'

# プロンプト:git名を表示する
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

########################################
# 補完
# 補完機能を有効にする
autoload -U compinit
compinit

# ^Aとかを効くようにする
bindkey -e

# Pivotalでtabキーを使ったcf コマンドの先読み展開機能
plugins=(git cf)

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# '#' 以降をコメントとして扱う
setopt interactive_comments

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
  
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
  
# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu

plugins=(git cf)
