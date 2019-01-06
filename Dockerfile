FROM openjdk:8
ENTRYPOINT ["echo", "$PWD"]
ADD ./target/spring-boot-web-0.0.1-SNAPSHOT.jar .
ADD docker-entrypoint.sh .
EXPOSE 9999
# Execute file at docker run.
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
