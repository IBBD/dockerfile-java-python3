# docker pull ibbd/java-python3
# Author: Alex
# Version: 2017-10-09
# 

FROM openjdk:8-slim

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# 安装列表：
# 1. Pypel
# 2. pip3
# https://pypi.python.org/packages/d2/c2/cda0e4ae97037ace419704b4ebb7584ed73ef420137ff2b79c64e1682c43/JPype1-0.6.2.tar.gz
# 可以忽略的错误：warning: command line option ‘-Wstrict-prototypes’ is valid for C/ObjC but not for C++
# Jpype安装依赖：g++, python3-dev, python3-setuptools, gcc
ENV PYPEL_V 0.6.2
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        python3-dev \
        wget \
        g++ \         
        gcc \
        python3-pip \
    && pip3 install -U \
        pip \
        setuptools \
    && cd ~/ \
    && wget https://pypi.python.org/packages/d2/c2/cda0e4ae97037ace419704b4ebb7584ed73ef420137ff2b79c64e1682c43/JPype1-$PYPEL_V.tar.gz \
    && tar -xvzf JPype1-$PYPEL_V.tar.gz \
    && cd JPype1-$PYPEL_V \
    && python3 setup.py install \
    && cd ~ \
    && rm JPype1-$PYPEL_V.tar.gz \
    && rm -r JPype1-$PYPEL_V \
    && pip3 uninstall -y \
        setuptools \
    && apt-get remove -y \
        python3-dev \
        wget \
        g++ \         
        gcc \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/* \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 工作目录
WORKDIR /var/www

# 解决时区问题
ENV TZ "Asia/Shanghai"

# 终端设置
# 默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"
