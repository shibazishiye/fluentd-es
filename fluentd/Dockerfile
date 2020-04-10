# fluentd/Dockerfile
FROM fluent/fluentd:v1.10.1-debian-1.0
USER root
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-document"]
USER fluent