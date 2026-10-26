FROM ghcr.io/containerbase/base:14.52.9@sha256:7829d02a3cd28f1662fc716cf3c1cc0c674f57e20ec4fca99b2aca62aa036973

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
