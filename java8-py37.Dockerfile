# docker pull ibbd/java-python3
# Author: Alex
# Version: 2019-09-06
# 

FROM openjdk:8-slim

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

RUN apt update -y \
    && apt install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-dev \
        build-essential \
        git \
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 安装系统包
# 安装常用的包
RUN pip3 install -U pip \
    && pip3 install JPype1 setuptools \
    && pip3 install numpy pandas scipy jieba

# 安装接口服务相关包
RUN pip3 install -U flask \
        flask_restful \
        flask-cors \
        flask-httpauth \
        pyyaml \
        chardet \
        gunicorn \
        cython \
    && git clone https://github.com/ibbd-dev/python-fire-rest /fire \
    && cd /fire \
    && pip3 install -r requirements.txt \
    && python3 setup.py install \
    && rm -rf /fire \
    && pip3 install fire

# 工作目录
RUN mkdir /var/www
WORKDIR /var/www

# 解决时区问题
ENV TZ "Asia/Shanghai"

# 终端设置
# 默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm
