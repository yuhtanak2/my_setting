export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# OSX のPATHは設定が変になるので対策
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

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

