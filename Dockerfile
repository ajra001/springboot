FROM openjdk:8
ADD /var/lib/jenkins/workspace/springboot_master/target/spring-boot-web-0.0.1-SNAPSHOT.jar /usr/local/bin/
ADD docker-entrypoint.sh .
EXPOSE 9999
# Execute file at docker run.
COPY /var/lib/jenkins/workspace/springboot_master/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN sh -c 'touch spring-boot-web-0.0.1-SNAPSHOT.jar'
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
