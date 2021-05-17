FROM maven:3.5-jdk-8 as build
WORKDIR /app
COPY . .
RUN mvn clean install


FROM openjdk:8-jdk-alpine
COPY --from=build /app/target/react-and-spring-data-rest-0.0.1-SNAPSHOT.jar react-and-spring-data-rest-0.0.1-SNAPSHOT.jar
EXPOSE 8080  
ENTRYPOINT ["java","-jar","./react-and-spring-data-rest-0.0.1-SNAPSHOT.jar"]

