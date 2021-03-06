export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH="/usr/local/opt/curl/bin:$PATH"

# OSX のPATHは設定が変になるので対策
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

#########################
# anyenv
#########################
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

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

