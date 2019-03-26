FROM centos:7.6.1810

ENV LANG C.UTF-8

# 复制 jdk 压缩包到镜像的 /usr/local/ 目录下
COPY jdk/jdk-8u202-linux-x64.tar.gz /usr/local/

# 解压 jdk 压缩包
RUN tar -xf /usr/local/jdk-8u202-linux-x64.tar.gz -C /usr/local/; \
    rm /usr/local/jdk-8u202-linux-x64.tar.gz;

# 设置 java 版本环境变量
ENV JAVA_VERSION 1.8.0_202

# 设置 java 环境变量
ENV JAVA_HOME /usr/local/jdk1.8.0_202
ENV JRE_HOME /usr/local/jdk1.8.0_202/jre

# 将 java 路径添加到 PATH 变量
ENV PATH $PATH:$JAVA_HOME/bin:$JRE_HOME/bin

# 操作系统优化：1、替换软件源为 华为源； 2、设置时区为东八区
RUN set -ex; \
    sed -i "s/#baseurl/baseurl/g" /etc/yum.repos.d/CentOS-Base.repo; \
    sed -i "s/mirrorlist=http/#mirrorlist=http/g" /etc/yum.repos.d/CentOS-Base.repo; \
    sed -i "s@http://mirror.centos.org@https://mirrors.huaweicloud.com@g" /etc/yum.repos.d/CentOS-Base.repo; \
    yum clean all; \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime;
