# Nginx
FROM nginx:1.23.3-alpine

ENV NGINX_SERVER_NAME=nginx
ENV NGINX_PORT=80

COPY default.conf.template /etc/nginx/templates/default.conf.template
COPY /stone/wasm-binaries/StoneWebViewer /usr/share/nginx/html/public/viewer-stone/
