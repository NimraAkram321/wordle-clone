FROM node AS build
LABEL maintainer ="nimra <nimraakram321@gmail.com>"


WORKDIR /home/node/app

COPY  package.json package-lock.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx:alpine

COPY --from=build /home/node/app/build /usr/share/nginx/html


