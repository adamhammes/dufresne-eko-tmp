FROM node:10

WORKDIR /app
ENV NODE_DIR=statamic/site/themes/dufresnes

COPY $NODE_DIR/package.json $NODE_DIR/yarn.lock ./
RUN yarn install

COPY $NODE_DIR/src/ ./src/

ENTRYPOINT ["yarn", "start"]
