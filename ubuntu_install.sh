#!/bin/sh

# 切换华为源 arm64架构
apt-get update
apt-get install -y wget
wget -O /etc/apt/sources.list https://repo.huaweicloud.com/repository/conf/Ubuntu-Ports-bionic.list
apt-get update

# 中文包设置
# todo

# vim安装
apt install -y vim
apt-get install -y git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# golang安装
rm /usr/local/go
# wget -O  ~/install_tmpdir/golang.tar.gz  http://go.dev/dl/go1.17.8.linux-arm64.tar.gz
wget -O  ~/install_tmpdir/golang.tar.gz  http://studygolang.com/dl/golang/go1.17.8.linux-arm64.tar.gz
tar -xvf ~/install_tmpdir/golang.tar.gz -C /usr/local
rm ~/install_tmpdir/golang.tar.gz
echo -e "\n# golang\nexport GOROOT=/usr/local/go\nexport GOPATH=$HOME/go\nexport PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> ~/.bashrc
echo -e '\n# export GOPROXY="https://proxy.golang.org,direct"\nexport GOPROXY="https://goproxy.cn" ' >> ~/.bashrc
source ~/.bashrc
go get -v github.com/rogpeppe/godef
go install -v github.com/rogpeppe/godef

# cmake安装
apt-get install -y build-essential libssl-dev
wget -O ~/install_tmpdir/cmake-3.19.2.tar.gz https://github.com/Kitware/CMake/releases/download/v3.19.2/cmake-3.19.2.tar.gz
cd ~/install_tmpdir/
tar -xvf cmake-3.19.2.tar.gz
cd cmake-3.19.2
./bootstrap
make && make install
hash -r
rm -rf ~/install_tmpdir/cmake-3.19.2

# 需要输入信息，之后安装
# apt-get install -y mono-complete

# 补全暂时不用
# git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
# cd ~/.vim/bundle/YouCompleteMe
# git submodule update --init --recursive
# apt-get install -y python3-dev
# ./install.py


# 容器端口暴露
# EXPOSE 6899
