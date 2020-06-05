FROM node:latest

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install google-chrome-stable -yq

RUN npm install -g @angular/cli

RUN mkdir app
COPY ./front-end ./app

WORKDIR /app

RUN npm install

CMD ["npm", "run", "start"]