FROM ghcr.io/containerbase/base:13.26.3@sha256:215fa907c2240e4f43911b0a2519db36ab54ce8807d171b8b629de6268e8090d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
