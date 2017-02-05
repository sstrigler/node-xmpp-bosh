FROM node:alpine
MAINTAINER Stefan Strigler <stefan@strigler.de>

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/

RUN apk add --no-cache --virtual build-deps git python build-base && \
    npm install && \
    apk del build-deps

# Bundle app source
COPY . /usr/src/app

EXPOSE 5280
CMD [ "npm", "start" ]
