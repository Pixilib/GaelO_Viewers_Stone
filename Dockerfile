# Stone
FROM alpine as stone
RUN apk --no-cache add wget
RUN apk add --update zip
RUN wget https://lsb.orthanc-server.com/stone-webviewer/2.2/wasm-binaries.zip
RUN mkdir /stone
RUN unzip wasm-binaries.zip -d /stone

# Nginx
FROM nginx:1.17-alpine

COPY nginx.config /etc/nginx/conf.d/default.conf

COPY --from=stone /stone/wasm-binaries/StoneWebViewer /usr/share/nginx/html/public/viewer-stone/
COPY ./public/viewers/Stone/configuration.json /usr/share/nginx/html/public/viewer-stone/
