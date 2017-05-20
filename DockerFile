FROM maven:alpine
MAINTAINER Jean-Philippe Plante <jean-philippe.plante@desjardins.com>

EXPOSE 8761
COPY . /app/
WORKDIR /app/
RUN mvn package
VOLUME /config
WORKDIR /
CMD java -Djava.security.egd=file:/dev/./urandom -jar /app/target/eureka-server-*.jar --server.port=8761 --spring.config.name=application
