#!/bin/sh

# yapi初始化后会有一个init.lock文件
lockPath="/yapi-virtual/init.lock"

# 进入yapi项目，如部署机器不同，请修改该路径
cd /yapi-virtual/vendors

# 安装必要包
npm config set registry https://registry.npm.taobao.org/
npm install -g fs-extra --registry https://registry.npm.taobao.org/
npm install -g safeify

# 如果初始化文件文件存在,则直接运行,否则初始化
if [ ! -f "$lockPath" ]; then
  # 启动Yapi初始化
  pm2 start server/install.js
  pm2 start server/app.js
else
  # 运行yapi管理系统
  pm2 start server/app.js
fi
