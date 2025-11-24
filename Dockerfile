FROM eclipse-temurin:17-jdk-alpine
    
EXPOSE 8080

RUN ls 

ENV APP_HOME=/usr/src/app

COPY /home/ubuntu/actions-runner/_work/Github-Actions-Project/Github-Actions-Project/app/*.jar $APP_HOME/app.jar

WORKDIR $APP_HOME

CMD ["java", "-jar", "app.jar"]
