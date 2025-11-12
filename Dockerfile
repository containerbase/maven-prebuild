FROM ghcr.io/containerbase/base:13.24.2@sha256:ec7d7a7fa9e69a4909f33bb0ed846021cd97f92b21530eccf187153405af2eca

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
