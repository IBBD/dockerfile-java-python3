# docker pull ibbd/java-python3
# Author: Alex
# Version: 2017-04-14
# 

FROM openjdk:8-slim

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# 安装gcc，make和zlib压缩/解压缩库,bz2依赖库
# python3安装依赖：software-properties-common, 
        #gcc make zlib1g-dev  \
        #libffi-dev libssl-dev libbz2-dev  \
    #&& apt-get install -y --no-install-recommends software-properties-common \
    #&& add-apt-repository ppa:jonathonf/python-3.6 \
    #&& apt-get update -y \
        #python3.6 \
# Jpype安装依赖：g++, python3-dev, python3-setuptools, gcc
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        gcc \
        python3-dev \
        wget \
        apt-utils \
        g++ \         
        python3-pip \
        python3-setuptools \
    && apt-get autoremove \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*


# Pypel安装
# https://pypi.python.org/packages/d2/c2/cda0e4ae97037ace419704b4ebb7584ed73ef420137ff2b79c64e1682c43/JPype1-0.6.2.tar.gz
# 可以忽略的错误：warning: command line option ‘-Wstrict-prototypes’ is valid for C/ObjC but not for C++
ENV PYPEL_V 0.6.2
RUN cd ~/ \
    && wget https://pypi.python.org/packages/d2/c2/cda0e4ae97037ace419704b4ebb7584ed73ef420137ff2b79c64e1682c43/JPype1-$PYPEL_V.tar.gz \
    && tar -xvzf JPype1-$PYPEL_V.tar.gz \
    && cd JPype1-$PYPEL_V \
    && python3 setup.py install \
    && cd ~ \
    && rm JPype1-$PYPEL_V.tar.gz \
    && rm -r JPype1-$PYPEL_V

# install ipython
# wheel: invalid command 'bdist_wheel'
RUN \
    pip3 install -U \
        pip \
        setuptools \
        wheel \
    && pip3 install -U \
        ipython \
        numpy \
        pandas \
        scipy \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && mkdir /var/www
  
# 工作目录
WORKDIR /var/www

# 解决时区问题
ENV TZ "Asia/Shanghai"

# 终端设置
# 默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"
