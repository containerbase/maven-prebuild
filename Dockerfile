FROM ghcr.io/containerbase/base:13.11.0@sha256:97fdde57ad63756836b5729417c4335709e6c49bd2b5831c392e07f17e3a966f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
