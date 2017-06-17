# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/php5/bin:$PATH
eval $(/usr/libexec/path_helper -s)

########################
# Go
#########################
export GOPATH=/usr/lib/x86_64-linux-gnu/go

#########################
# Elasticsearch
#########################
export ELASTICPATH=/usr/local/opt/elasticsearch/libexec/bin/elasticsearch-plugin
export PATH=$PATH:$ELASTICPATH

if [ -x `which zsh` ]; then
    exec zsh
elif [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#########################
# コマンドオプション
#########################
alias grep='grep --color=auto'
alias tree='tree -N'
#########################
# オリジナルコマンド
#########################
alias all_command='~/shell/command_all.sh'
alias get_repository='~/shell/get_repository.sh'
alias locate_up='sudo /usr/libexec/locate.updatedb'
alias memo_c='cat ~/.memo | grep -v ^#'
alias memo_v='vim ~/.memo'
alias open_unity='open -n /Applications/Unity/Unity.app'
alias open_xamarin='open -n /Applications/Xamarin\ Studio.app'
alias viewoff='defaults delete com.apple.finder AppleShowAllFiles;killall Finder;'
alias viewon='defaults write com.apple.finder AppleShowAllFiles -boolean true;killall Finder;'
