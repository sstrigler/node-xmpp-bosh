FROM node:alpine
MAINTAINER Stefan Strigler <stefan@strigler.de>

RUN apk add --no-cache --virtual build-deps git python build-base

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

RUN apk del build-deps

# Bundle app source
COPY . /usr/src/app

EXPOSE 5280
CMD [ "npm", "start" ]
