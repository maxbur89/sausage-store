FROM node:14.17.3 AS builder

WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run build

# Multi stage
FROM node:17-alpine3.14

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/dist/frontend /usr/src/app/dist/frontend

RUN npm install -g http-server

RUN groupadd --gid 1002 admin \
    && useradd --uid 1001 --gid 1002 admin

USER admin

EXPOSE 80

ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://sausage-store-backend:8080"]
