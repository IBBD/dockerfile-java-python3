# 用做API接口使用
# docker pull ibbd/java-python3-server
#
# Version 2017-04-18

FROM ibbd/java-python3

MAINTAINER Alex Cai cyy0523xc@gmail.com

RUN \
    apt update \
    && apt install -y --no-install-recommends build-essential \
    && apt autoremove \
    && apt clean \
    && rm -r /var/lib/apt/lists/*

RUN \
    pip3 install -U flask \
        flask_restful \
        flask-cors \
        flask-httpauth \
        pyyaml \
        chardet \
        jieba \
        gunicorn \
        cython

