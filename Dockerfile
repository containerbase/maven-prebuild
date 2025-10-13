FROM ghcr.io/containerbase/base:13.20.5@sha256:daa607e61a89f2da4a81be195568cda0e8c673a750d6e24e42feec754cd96870

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
