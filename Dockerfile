FROM node:16
# Installing libvips-dev for sharp compatability
RUN apt-get update && apt-get install libvips-dev -y

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /opt/

COPY ./package.json ./
COPY ./yarn.lock ./

ENV PATH /opt/node_modules/.bin:$PATH

RUN yarn

WORKDIR /opt/app

COPY ./ .

RUN yarn run build

EXPOSE 1337

CMD yarn run develop