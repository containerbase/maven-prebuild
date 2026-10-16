FROM ghcr.io/containerbase/base:14.41.1@sha256:9bf0c432aad042fec7112905e8e443b4e1ad3ee640a85abd718fd0893d3a060d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
