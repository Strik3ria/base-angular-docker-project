FROM node:latest

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install google-chrome-stable -yq


WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY /front-end/package.json /app/package.json
RUN npm install
RUN npm install -g @angular/cli@7.3.9

COPY /front-end /app

CMD ["npm", "run", "start"]