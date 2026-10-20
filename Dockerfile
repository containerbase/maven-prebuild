FROM ghcr.io/containerbase/base:14.44.3@sha256:7d287f1b251352728bed1df465cdcf4b89f629acb76fcff03739bd968788ac6d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
