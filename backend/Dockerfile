ARG RUN_IMAGE=gcr.io/distroless/nodejs18-debian11
FROM node:18 AS build-env

COPY package*.json /app/

WORKDIR /app

ARG NODE_ENV=production
RUN npm ci

COPY src/. /app/src/

FROM ${RUN_IMAGE}

COPY --from=build-env /app /app

WORKDIR /app

EXPOSE 9000

CMD ["src/index.js"]
