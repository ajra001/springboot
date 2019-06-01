FROM openjdk:8
COPY target/spring-boot-web-0.0.1-SNAPSHOT.jar /usr/local/bin/
ADD docker-entrypoint.sh .
EXPOSE 9999
# Execute file at docker run.
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN sh -c 'touch spring-boot-web-0.0.1-SNAPSHOT.jar'
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
