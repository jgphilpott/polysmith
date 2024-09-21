FROM node:latest

COPY ./ /root
WORKDIR /root

RUN npm install

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y wget curl

RUN npm install --global coffeescript
RUN coffee -cb --no-header app

RUN npm install --global nodemon
CMD ["nodemon", "--exec", "coffee", "app/root.coffee"]