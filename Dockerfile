FROM maven:3.8.4-jdk-11 as BUILD
WORKDIR /app
COPY . .
RUN mvn package


FROM openjdk:11
WORKDIR /app
COPY --from="BUILD" /app/target/ApiCinema-0.0.1-SNAPSHOT.jar ./app.jar
EXPOSE 8085
CMD [ "java", "-jar", "app.jar"]