FROM maven:alpine
MAINTAINER Jean-Philippe Plante <jean-philippe.plante@desjardins.com>

EXPOSE 8761
COPY . /app/
WORKDIR /app/
RUN chmod 777 /app/scripts/wait-for-it.sh
RUN mvn package -DskipTests

WORKDIR /
CMD /app/scripts/wait-for-it.sh configserver:8888 --timeout=60 --strict -- java -Dspring.profiles.active=docker -Djava.security.egd=file:/dev/./urandom -jar /app/target/eureka-server-*.jar --server.port=8761 --spring.config.name=application
