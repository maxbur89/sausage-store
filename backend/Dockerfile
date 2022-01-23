FROM maven:3.8.3-openjdk-16 AS builder

ARG APP_VERSION

WORKDIR /backend

COPY ./src ./src
COPY *.xml ./

# запуск сборки кода
# создание директории, в которую копируются артефакты. Это нужно для организации удобной структуры архива
RUN mvn package -Dversion.application=$APP_VERSION


# Multi stage
FROM maven:3.8.3-openjdk-16-slim

ARG APP_VERSION

# копирование собранного бэкенда
WORKDIR /backend/sausage-store

RUN printf "java -jar /backend/sausage-store/sausage-store-${APP_VERSION}.jar \
            --spring.datasource.url=\$DATA_SOURCE_CONNECT \
            --spring.datasource.username=\$DATA_SOURCE_NAME \
            --spring.datasource.password=\$DATA_SOURCE_PASS \
            --spring.data.mongodb.uri=\$MONGO_CONNECT" \
            > /backend/sausage-store/run_script.sh && chmod +x /backend/sausage-store/run_script.sh \
            && groupadd --gid 1002 admin \
            && useradd --uid 1001 --gid 1002 admin

COPY --chown=admin:admin --from=builder /backend/target/sausage-store-$APP_VERSION.jar /backend/sausage-store/sausage-store-$APP_VERSION.jar

USER admin

EXPOSE 8080

ENTRYPOINT /backend/sausage-store/run_script.sh
