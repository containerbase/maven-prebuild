FROM ghcr.io/containerbase/base:13.25.4@sha256:ac311de198090a6dbb1724c27e17c73050aa8b4039c0894f5c395d75bd7009b1

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
