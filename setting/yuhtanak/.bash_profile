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

