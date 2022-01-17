FROM maven:3.8.3-openjdk-16 AS builder

ARG APP_VERSION

WORKDIR /backend

COPY ./src /backend/src
COPY *.xml /backend/

# запуск сборки кода
# создание директории, в которую копируются артефакты. Это нужно для организации удобной структуры архива
RUN mvn package -Dversion.application=$APP_VERSION && mkdir /backend/sausage-store


# Multi stage
FROM maven:3.8.3-openjdk-16-slim

ARG APP_VERSION

# копирование собранного бэкенда
WORKDIR /backend
RUN mkdir /backend/sausage-store

COPY -chown=admin:admin --from=builder /backend/target/sausage-store.jar /backend/sausage-store/sausage-store.jar
# COPY -chown=admin:admin --from=builder /backend/*.xml /backend/
# COPY -chown=admin:admin --from=builder /backend/src /backend/src

RUN printf "java -jar /backend/sausage-store/sausage-store.jar \
            --spring.datasource.url=\$DATA_SOURCE_CONNECT \
            --spring.datasource.username=\$DATA_SOURCE_NAME \
            --spring.datasource.password=\$DATA_SOURCE_PASS \
            --spring.data.mongodb.uri=\$MONGO_CONNECT" \
            > /backend/sausage-store/run_script.sh && chmod +x /backend/sausage-store/run_script.sh

RUN groupadd --gid 1002 admin \
    && useradd --uid 1001 --gid 1002 admin

USER admin

EXPOSE 8080

ENTRYPOINT /backend/sausage-store/run_script.sh