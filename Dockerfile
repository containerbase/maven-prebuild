FROM ghcr.io/containerbase/base:14.66.18@sha256:ef783875a4f1da2b918b88118ee3c7cbce5d987caea528a705cc1c67bbab25c9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
