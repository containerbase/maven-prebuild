FROM ghcr.io/containerbase/base:14.15.1@sha256:b92cf6dc5dc0f57d812597ef0610803e45f00dd7993e31f95f7fdfd3da715145

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
