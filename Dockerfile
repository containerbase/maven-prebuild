FROM ghcr.io/containerbase/base:13.10.10@sha256:4389fcabea8aaa14b0d0a6c77d96c4bd63bff2c8014b1d3d8eb29c7194a36824

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
