FROM node:12-alpine
RUN apk add --no-cache python2 g++ make
RUN apk add git 
RUN apk add openssh

WORKDIR /app

COPY . .
RUN rm -Rf /var/www/html/*
RUN git clone https://github.com/fanambinantsoa/node-docker-app.git
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000