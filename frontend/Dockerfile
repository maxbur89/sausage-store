FROM node:14.17.3 AS builder

WORKDIR /usr/src/app
COPY . .

RUN npm install && npm run build

# Multi stage
FROM node:17-alpine3.14

WORKDIR /usr/src/app

COPY -chown=admin:admin --from=builder /usr/src/app/dist/frontend /usr/src/app/dist/frontend

RUN npm install -g http-server && adduser -D admin -u 1001

USER admin

EXPOSE 80

ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://sausage-store-backend:8080"]
