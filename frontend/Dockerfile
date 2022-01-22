FROM alpine:3.15 AS builder
WORKDIR /usr/src/app
COPY *.json ./
RUN apk add --no-cache npm==8.1.3-r0 \
    && npm install
COPY ./src ./src
RUN npm run build


FROM alpine:3.15 AS dependencies
WORKDIR /usr/src/app
COPY *.json ./
RUN apk add --no-cache npm==8.1.3-r0 \
    && npm install --only=production


FROM alpine:3.15
WORKDIR /usr/src/app

RUN adduser -D admin -u 1001

COPY --chown=admin:admin --from=builder /usr/src/app/dist/frontend ./dist/frontend
COPY --chown=admin:admin --from=dependencies ./node_modules ./node_modules
COPY package.json .
RUN apk add --no-cache npm==8.1.3-r0 \
    && npm install -g http-server@14.0.0

USER admin

EXPOSE 80
ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://sausage-store-backend:8080"]
