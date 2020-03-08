FROM nginx:alpine
MAINTAINER Eric Lee
# 修改源
RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/latest-stable/community/" >> /etc/apk/repositories
# 安装需要的软件
RUN apk update && \
    apk add --no-cache ca-certificates && \
    apk add --no-cache curl bash tree tzdata && \
    cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN mkdir /app
WORKDIR /app
# 将目录下的文件copy到镜像中
COPY nginx.conf /etc/nginx/nginx.conf

COPY favicon.ico /usr/share/nginx/html/
COPY index.html /usr/share/nginx/html/
COPY js/* /usr/share/nginx/html/js/
COPY meta/* /usr/share/nginx/html/meta/
COPY style/* /usr/share/nginx/html/style/
# 开放80端口
EXPOSE 80
# 启动nginx命令
CMD ["nginx", "-g", "daemon off;"]