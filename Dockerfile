FROM node:latest AS build-stage
WORKDIR /
COPY package*.json ./
RUN npm install
COPY ./. ./.
EXPOSE 2018
CMD [ "node", "server.js" ]