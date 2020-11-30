#!/bin/bash

#安装lua-nginx-module
cd /opt/
wget http://luajit.org/download/LuaJIT-2.0.5.tar.gz
tar -zxvf  LuaJIT-2.0.5.tar.gz
cd LuaJIT-2.0.5
make install PREFIX=/usr/local/LuaJIT

#添加环境变量
cp /etc/profile /etc/profile.bak
echo 'export LUAJIT_LIB=/usr/local/LuaJIT/lib' >> /etc/profile
echo 'export LUAJIT_INC=/usr/local/LuaJIT/include/luajit-2.0' >> /etc/profile
source /etc/profile

#安装ngx_devel_kit
cd /opt/
wget https://github.com/simplresty/ngx_devel_kit/archive/v0.3.0.tar.gz
tar zxvf v0.3.0.tar.gz
ls | grep ngx_devel_kit

#安装lua-nginx-module
cd /opt/
wget https://github.com/openresty/lua-nginx-module/archive/v0.10.13.tar.gz
tar zxvf v0.10.13.tar.gz
ls | grep lua-nginx

#需要安装pcre依赖库
yum install -y lua-devel python-devel readline-devel pcre-devel openssl-devel
