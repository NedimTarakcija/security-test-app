# FROM node:latest as build
# WORKDIR /usr/local/app
# COPY ./ /usr/local/app

# RUN npm install
# RUN npm run build

# FROM nginx:latest
# COPY --from=build /usr/local/app/dist/security-test-app /usr/share/nginx/html
# EXPOSE 4200


FROM node:19.7-bullseye-slim
RUN mkdir /home/node/app && chown node:node /home/node/app
RUN mkdir /home/node/app/node_modules && chown node:node /home/node/app/node_modules
WORKDIR  /home/node/app
USER node
COPY --chown=node:node package.json package-lock.json ./
RUN npm ci --quiet
COPY --chown=node:node . .