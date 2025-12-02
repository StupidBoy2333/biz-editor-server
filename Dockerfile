# Dockerfile
FROM node:14
WORKDIR /app
COPY . /app

# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
# 安装
RUN npm set registry https://mirrors.cloud.tencent.com/npm/
RUN npm i

# 启动
CMD npm run prd-dev && npx pm2 log
