### Yapi

yapi官网 http://yapi.dapengjiaoyu.com/

yapi-virtual适用于虚拟机部署yapi

部署步骤为

1. 拷贝yapi-virtual到宿主机
2. 填写config.json内的server域名或ip
3. cd /yapi-virtual/vendors
4. npm install --production --registry https://registry.npm.taobao.org
5. cd /yapi-virtual
6. nohup sh entrypoint.sh > out.txt 2&1 &



Docker部署(机器手动部署)
1. cd /yapi
2. docker build -f Dockerfile -t demoyapi .
3. docker run -d --name=yapi -p 3000:3000 demoyapi

pm2基本使用

pm2 list查看运行中的nodejs项目

pm2 start

pm2 stop

pm2 delete id
