#!/bin/bash
# 
# 将国内的源复制到容器中
# Author: Alex
# Created Time: 2017年04月18日 星期二 11时48分50秒

docker cp sources.list ibbd-java-py3:/etc/apt/sources.list
