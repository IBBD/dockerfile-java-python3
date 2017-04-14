# 
# Author: Alex
# Version: 2017-04-14
# 

FROM java:8

MAINTAINER Alex Cai cyy0523xc@gmail.com

RUN apt-get update \
    && apt-get install apt-utils g++ python3 python-dev python-pip python-mock -y \
    && pip install ipython \
    && pip install flask \
    && pip install flask_restful \
    && pip install pyyaml \
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

RUN mkdir /var/www

WORKDIR /var/www

# 解决时区问题
ENV TZ "Asia/Shanghai"
