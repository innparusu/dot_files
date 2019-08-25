# not read /etc
setopt no_global_rcs

#パス設定
eval `/usr/libexec/path_helper -s`
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export CUDA_ROOT=/usr/local/cuda
export PATH=$CUDA_ROOT/bin:$PATH
export CUDA_PATH=/usr/local/cuda
export CUDA_INCLUDE=$CUDA_ROOT/include
export DYLD_LIBRARY_PATH=$CUDA_ROOT/lib:$DYLD_LIBRARY_PATH
export PATH=$HOME/bin:$PATH
export GOPATH=$HOME/.go
# postgreSQL
export PGDATA=/usr/local/var/postgres

#rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
