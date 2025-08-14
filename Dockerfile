FROM ghcr.io/containerbase/base:13.8.66@sha256:70fc43c8b3e96c665a5a824afc7fabbf429aaaeee9fc442f0b852faa4f2f4bce

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
