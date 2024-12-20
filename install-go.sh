#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
go_tar_gz_path="$root_path/go.tar.gz"
sudo tar -zxvf "$go_tar_gz_path" -C "/usr/local/"
#设置go语言相关的环境变量
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.profile
echo 'export GOPATH=$HOME/go' >> $HOME/.profile
echo 'export PATH=$PATH:$GOPATH/bin' >> $HOME/.profile
#设置代理服务器地址修正如下问题:
#$ go install golang.org/x/lint/golint@latest
#go: golang.org/x/lint/golint@latest:
#module golang.org/x/lint/golint:
#Get "https://proxy.golang.org/golang.org/x/lint/golint/@v/list":
#dial tcp 142.250.66.81:443: i/o timeout
echo 'export GOPROXY=https://goproxy.io' >> $HOME/.profile
source $HOME/.profile
#显示go语言的版本信息
go version
#安装goimports
go install golang.org/x/tools/cmd/goimports@latest
#安装golint
go install golang.org/x/lint/golint@latest
