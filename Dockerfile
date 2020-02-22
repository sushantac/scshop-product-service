FROM java:8
VOLUME /tmp
EXPOSE 8003
COPY ./target/product-service-0.0.1-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app
RUN sh -c 'touch product-service-0.0.1-SNAPSHOT.jar'
ENTRYPOINT exec java $JAVA_OPTS -jar product-service-0.0.1-SNAPSHOT.jar