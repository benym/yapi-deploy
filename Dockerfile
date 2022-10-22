FROM node:11 as builder
RUN apt-get install -y git python make openssl tar gcc
RUN mkdir /yapi
RUN mkdir /yapi/vendors
COPY yapi-1.9.3.tar.gz /
# 配置yapi的配置文件
RUN tar -xvf yapi-1.9.3.tar.gz
RUN pwd
RUN ls
RUN mv yapi-1.9.3/* /yapi/vendors
RUN ls /yapi/vendors/
RUN npm config set registry https://registry.npm.taobao.org
RUN npm config set disturl https://npm.taobao.org/dist
RUN cd /yapi/vendors/ && npm i --production --registry https://registry.npm.taobao.org;

FROM node:11
WORKDIR /yapi/vendors
COPY --from=builder /yapi/vendors /yapi/vendors
ENV TZ="Asia/Shanghai"
# 复制执行脚本到容器的执行目录
COPY entrypoint.sh /usr/local/bin
COPY config.json /yapi/
RUN chmod +x /usr/local/bin/entrypoint.sh
# 向外暴露的端口
EXPOSE 3000
# 配置入口为bash shell
ENTRYPOINT ["entrypoint.sh"]
