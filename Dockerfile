FROM ghcr.io/containerbase/base:13.21.0@sha256:b0c48e6d3690a48fc33fed6129fd0b9c7899793b035d47de57e6a479379cf655

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
