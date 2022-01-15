FROM maven:3.8.3-openjdk-16

ARG APP_VERSION=1.0.0-def

COPY ./src /backend/src
COPY *.xml /backend/

WORKDIR /backend

# запуск сборки кода
RUN mvn package -Dversion.application=$APP_VERSION

# создание директории, в которую копируются артефакты. Это нужно для организации удобной структуры архива
RUN mkdir /backend/sausage-store

# копирование собранного бэкенда
RUN mv /backend/target/sausage-store-$APP_VERSION.jar /backend/sausage-store/sausage-store-$APP_VERSION.jar

ENTRYPOINT ["java","-jar","/backend/sausage-store/sausage-store-${APP_VERSION}.jar"]

# docker build --build-arg APP_VERSION=1.0.0-def -t sausage-store-backend:latest .