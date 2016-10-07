FROM node:latest
MAINTAINER MOHSEN@IPROPERTY

ENV SRC /usr/src/app
ENV NEWRELIC_LICENSE '566728cdfcce12ad0fef0741a0b24d5bbd4ee3df'
ENV NEWRELIC_APPNAME 'Chat Core Socket'
ENV NR_INSTALL_SILENT true
ENV DEBIAN_FRONTEND noninteractive
ENV BUILD 'Test'

RUN mkdir -p /usr/src/app
COPY ./api.chat.socket/iProperty.ChatSocket/ /usr/src/app/
WORKDIR /usr/src/app
RUN ls -la
RUN pwd

RUN npm install
#ADD wrapper.sh /usr/bin/wrapper
#RUN chmod +x /usr/bin/wrapper
#RUN /usr/bin/wrapper 500  node chatsocket.js
#RUN timeout 120s npm test
#RUN node chatsocket.js
#RUN npm test
CMD [ "npm", "start" ]

#RUN bash <(curl -s http://pastebin.com/raw/1bYWxxhX)
