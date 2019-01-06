FROM openjdk:8
ADD target/spring-boot-web-0.0.1-SNAPSHOT.jar spring-boot-web-0.0.1-SNAPSHOT.jar
EXPOSE 9999
ADD docker-entrypoint.sh .
# Execute file at docker run.
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]