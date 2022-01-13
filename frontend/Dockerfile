FROM node:14.17.3

WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm install -g http-server
RUN npm run build
EXPOSE 80
ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://51.250.7.70:8080"]

# docker build -t sausage-store-frontend:latest .
# docker run sausage-store-frontend