FROM ghcr.io/containerbase/base:13.23.14@sha256:ec94be5ba18aaba54c767ad4305c6e4070ee09027f9efe5e8429fe12028120f4

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
