#nginx1.16.1 with http_sub_module & open jdk8u212
FROM centos:7
#设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
#安装常用资源库
RUN yum update -y && yum install -y wget telnet vim curl iproute cron && yum clean all
#安装编译nginx需要依赖库
RUN yum install -y gcc gcc-c++ automake zlib zlib-devel openssl openssl-devel pcre pcre-devel net-tools && yum clean all
#安装nginx模块lua-nginx-module以支持lua脚本
COPY deploy_nignx_lua.sh /opt/deploy_nignx_lua.sh
RUN sh /opt/deploy_nignx_lua.sh
#编译安装nginx
RUN wget http://nginx.org/download/nginx-1.16.1.tar.gz
RUN tar -xvf nginx-*.tar.gz && rm -rf nginx-*.tar.gz
RUN cd nginx-* && ./configure --with-http_stub_status_module --with-http_sub_module --with-http_ssl_module --with-ld-opt=-Wl,-rpath,/usr/local/LuaJIT/lib --add-module=/opt/ngx_devel_kit-0.3.0 --add-module=/opt/lua-nginx-module-0.10.13 && make -j2 && make install
RUN rm -rf nginx-*
#重定Nginx日志到垃圾桶防止日志爆掉
RUN mkdir /var/log/nginx
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
#启动Nginx
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80
