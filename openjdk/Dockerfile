# docker pull ibbd/java-python3
# Author: Alex
# Version: 2017-04-14
# 

FROM openjdk:8-slim

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

#  3.6.1

# 安装gcc，make和zlib压缩/解压缩库,bz2依赖库
RUN  apt-get update \
    && apt-get install -y --no-install-recommends \
        gcc make zlib1g-dev  \
        libffi-dev libssl-dev libbz2-dev  \
        python3-dev  

# python3安装
ENV PYTHON_V 3.6.2
RUN  \
    wget https://www.python.org/ftp/python/$PYTHON_V/Python-$PYTHON_V.tar.xz \
    && tar xJf Python-$PYTHON_V.tar.xz  \
    && cd Python-$PYTHON_V \
    &&  sed -i 's/#SSL=/SSL=/g' Modules/Setup.dist \
    &&  sed -i 's/#zlib/zlib/g' Modules/Setup.dist \
    &&  echo  "_ssl _ssl.c -DUSE_SSL -I$(SSL)/include -I$(SSL)/include/openssl  -L$(SSL)/lib -lssl -lcrypto " >> Modules/Setup.dist \
    && ./configure  --enable-optimizations \
    &&  make && make install \
    &&  cd .. \
    &&  rm  Python-$PYTHON_V.tar.xz -f \
    &&  rm  -rf Python-$PYTHON_V 

RUN  \
    apt-get install -y --no-install-recommends \
        apt-utils \
        g++ \         
        python3-pip \
    && apt-get upgrade -y \
    && apt-get autoremove \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

# Pypel安装
# https://pypi.python.org/packages/d2/c2/cda0e4ae97037ace419704b4ebb7584ed73ef420137ff2b79c64e1682c43/JPype1-0.6.2.tar.gz
ENV PYPEL_V 0.6.2
RUN cd ~/ \
    && wget https://pypi.python.org/packages/d2/c2/cda0e4ae97037ace419704b4ebb7584ed73ef420137ff2b79c64e1682c43/JPype1-$PYPEL_V.tar.gz \
    && tar -xvzf JPype1-$PYPEL_V.tar.gz \
    && cd JPype1-$PYPEL_V \
    && python3 setup.py install \
    && cd ~ \
    && rm JPype1-$PYPEL_V.tar.gz \
    && rm -r JPype1-$PYPEL_V
#RUN cd ~/ \
    #&& wget https://pypi.python.org/packages/59/90/149647ac2c8649a5983fcc47c78f2881af80cbd99f54248ac31b3d611618/JPype1-py3-0.5.5.2.tar.gz#md5=06481b851244abb37d45f3a03f0f0455 \
    #&& tar -xvzf JPype1-py3-0.5.5.2.tar.gz \
    #&& cd JPype1-py3-0.5.5.2 \
    #&& python3 setup.py install \
    #&& cd ~ \
    #&& rm JPype1-py3-0.5.5.2.tar.gz \
    #&& rm -r JPype1-py3-0.5.5.2

# install ipython
RUN \
    pip3 install -U pip \
        setuptools \
    && pip3 install ipython \
        numpy \
        pandas \
        scipy \
        nltk \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
  
# 工作目录
RUN mkdir /var/www
WORKDIR /var/www

# 解决时区问题
ENV TZ "Asia/Shanghai"

# 终端设置
# 默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"
