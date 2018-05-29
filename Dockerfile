FROM node:latest

RUN apt-get update
RUN apt-get install -y libxss1 libappindicator1 libindicator7 libx11-xcb1 libxtst6 libnss3 libasound2 libatk-bridge2.0 libgtk-3-0 fonts-ipafont fonts-ipaexfont
RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

WORKDIR /src

ADD package.json .
RUN npm install
ADD index.js .

ENTRYPOINT [ "node" ]
CMD [ "index.js" ]
