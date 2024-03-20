FROM ghcr.io/containerbase/base:10.3.4@sha256:b1455e48a98351a69ba0cedb4311b6f6dca70fe5f5c6d6be28ed8903eca60e9a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
