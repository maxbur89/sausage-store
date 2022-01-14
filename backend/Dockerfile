FROM maven:3.8.3-openjdk-16

ARG APP_VERSION

COPY ./src /backend/src
COPY *.xml /backend/

WORKDIR /backend

# запуск сборки кода
RUN mvn package -Dversion.application=$APP_VERSION

# создание директории, в которую копируются артефакты. Это нужно для организации удобной структуры архива
RUN mkdir /backend/sausage-store

# копирование собранного бэкенда
RUN mv /backend/target/sausage-store-$APP_VERSION.jar /backend/sausage-store/sausage-store-$APP_VERSION.jar

RUN printf "java -jar /backend/sausage-store/sausage-store-${APP_VERSION}.jar \
            --spring.datasource.url=$DATA_SOURCE_CONNECT \
            --spring.datasource.username=$DATA_SOURCE_NAME \
            --spring.datasource.password=$DATA_SOURCE_PASS \
            --spring.data.mongodb.uri=$MONGO_CONNECT" \
            > /backend/sausage-store/run_script.sh && chmod +x /backend/sausage-store/run_script.sh

EXPOSE 8080

ENTRYPOINT /backend/sausage-store/run_script.sh
