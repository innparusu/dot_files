# not read /etc
setopt no_global_rcs

#パス設定
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi
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
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.rbenv/plugins/ruby-build/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH=$HOME/.cargo/bin:$PATH

#gradle
export PATH=/usr/local/gradle/bin:$PATH

# maven
export M2_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}
