FROM openjdk:8
ADD ./tspringboot_master/target/spring-boot-web-0.0.1-SNAPSHOT.jar .
EXPOSE 9999
ADD docker-entrypoint.sh .
# Execute file at docker run.
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
