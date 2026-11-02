FROM ghcr.io/containerbase/base:14.61.0@sha256:f7aab6a33cf36affdbeed71ae3c4248c48af562b2fa8c12474748899bf5cd93d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
