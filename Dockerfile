# FROM node:16-alpine

# WORKDIR /app/frontend/

# COPY package*.json ./
# RUN npm install

# COPY . ./

# CMD ["npm", "start"]

FROM node:16.14.2

WORKDIR /usr/src/app

COPY package*.json /usr/src/app

RUN npm install -g react-scripts

COPY . /usr/src/app

RUN chown -R node:node /usr/src/app

RUN chmod 755 /usr/src/app

USER node

EXPOSE 3000

CMD [ "sh", "-c", "npm install && npm run start" ]