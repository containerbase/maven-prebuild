FROM ghcr.io/containerbase/base:13.10.9@sha256:f14ec1b5d7e1c557069a3fd2d5302d173d914d66da35d70a13fedd5e3a68f821

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
