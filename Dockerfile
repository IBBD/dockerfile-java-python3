# 
# Author: Alex
# Version: 2017-04-14
# 

FROM java:8

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-utils \
        g++ \
        python3.5 \
        python3-dev \
        python3-pip \
        python3-mock \
    && pip install ipython \
    && apt-get autoremove \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

RUN cd ~/ \
    && wget https://pypi.python.org/packages/d2/c2/cda0e4ae97037ace419704b4ebb7584ed73ef420137ff2b79c64e1682c43/JPype1-0.6.2.tar.gz \
    && tar -xvzf JPype1-0.6.2.tar.gz \
    && cd JPype1-0.6.2 \
    && python setup.py install \
    && cd ~ \
    && rm JPype1-0.6.2.tar.gz \
    && rm -r JPype1-0.6.2

# 工作目录
RUN mkdir /var/www
WORKDIR /var/www

# 解决时区问题
ENV TZ "Asia/Shanghai"

# 终端设置
# 执行php-fpm时，默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"
