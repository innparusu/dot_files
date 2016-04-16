# not read /etc
setopt no_global_rcs

#パス設定
eval `/usr/libexec/path_helper -s`
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
#rbenv
eval "$(rbenv init -)"
#pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
