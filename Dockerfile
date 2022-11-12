FROM node:10-alpine  as build
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app 
WORKDIR /home/node/app 
RUN npm install 
COPY --chown=node:node . .

FROM node:alpine as main
COPY --from=build /home/node/app / 
EXPOSE 8080 
CMD [ "node" , "App.js"]