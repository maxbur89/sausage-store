FROM node:14.17.3

WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm install -g http-server
RUN npm run build
EXPOSE 80

RUN groupadd --gid 1002 admin \
    && useradd --uid 1001 --gid 1002 admin

USER admin

ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://sausage-store-backend:8080"]
