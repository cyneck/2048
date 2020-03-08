FROM nginx:alpine
MAINTAINER Eric Lee
WORKDIR app
COPY app/ /usr/share/nginx/html/
COPY app/nginx.conf /etc/nginx/nginx.conf
RUN echo 'app start'