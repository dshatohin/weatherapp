FROM node:18 AS build-env

COPY package*.json /app/

WORKDIR /app

RUN npm ci

COPY src/. /app/src/
COPY webpack.prod.js /app/

ENV NODE_OPTIONS=--openssl-legacy-provider
ARG ENDPOINT=http://api.shatohin.space/api
RUN /app/node_modules/.bin/webpack --config webpack.prod.js

FROM nginx:1.23

COPY --from=build-env /app/dist/ /usr/share/nginx/html
COPY nginx.conf.template /etc/nginx/templates/

ENV NGINX_PORT=8000

EXPOSE 8000
