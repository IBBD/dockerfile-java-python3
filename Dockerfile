# docker pull ibbd/java-python3
# Author: Alex
# Version: 2017-04-14
# 

FROM java:8

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# TODO 默认安装的是py3.4，需要增加相应的源，才能装上3.5

# 安装gcc，make和zlib压缩/解压缩库
RUN  apt-get update \
     && apt-get install -y --no-install-recommends \
     gcc make zlib1g-dev 

ENV PYTHON_V 3.6.1

RUN  \
    wget https://www.python.org/ftp/python/$PYTHON_V/Python-$PYTHON_V.tar.xz \
    && tar xJf Python-$PYTHON_V.tar.xz  \
    && cd $PYTHON_V \
    && ./configure  \
    &&  make && make install \
    &&  cd .. \
    &&  rm  Python-$PYTHON_V.tar.xz -f \
    &&  rm  -rf $PYTHON_V 

RUN  \
    apt-get install -y --no-install-recommends \
        apt-utils \
        g++ \        
        python3-dev \
        python3-pip \
    && apt-get upgrade -y \
    && apt-get autoremove \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

RUN cd ~/ \
    && wget https://pypi.python.org/packages/59/90/149647ac2c8649a5983fcc47c78f2881af80cbd99f54248ac31b3d611618/JPype1-py3-0.5.5.2.tar.gz#md5=06481b851244abb37d45f3a03f0f0455 \
    && tar -xvzf JPype1-py3-0.5.5.2.tar.gz \
    && cd JPype1-py3-0.5.5.2 \
    && python3 setup.py install \
    && cd ~ \
    && rm JPype1-py3-0.5.5.2.tar.gz \
    && rm -r JPype1-py3-0.5.5.2

# install ipython
RUN \
    pip3 install -U pip \
        setuptools \
    && pip3 install ipython

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
