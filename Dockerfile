FROM ghcr.io/containerbase/base:14.10.18@sha256:05d99a4740248c7248ee250d37c0df151443b27e59bcb8e715bce78adbb1d6b8

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
