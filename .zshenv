#パス設定
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
#rbenv
eval "$(rbenv init -)"
#pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
