## Use an official node version as a parent image
#FROM node:9.6.1
#
## Create app directory
#RUN mkdir -p /src/app
#WORKDIR /src/app
#
## Install any needed packages specified in requirements.txt
#COPY package.json /src/app/
#RUN npm install
#RUN npm install -g @angular/cli@1.7.1
#
## Bundle app source
#COPY . /src/app
#
## Make port 4200 available to the world outside this container
#EXPOSE 4200
#
## Define environment variable
##ENV DEBUG True
#
#VOLUME ["/var/lib/docker/volumes/jtmVol"]
#
## Run
##CMD ["node", "index.js"]
##CMD ["npm", "run", "start"]
#CMD ["ng", "serve"]
## RUN ng serve
#
# base image
FROM node:9.6.1

# install chrome for protractor tests
#RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
#RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#RUN apt-get update && apt-get install -yq google-chrome-stable

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /usr/src/app/package.json
RUN npm install
RUN npm install -g @angular/cli@1.7.1

# add app
COPY . /usr/src/app

# start app
CMD ng serve --host 0.0.0.0
