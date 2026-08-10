FROM ghcr.io/containerbase/base:14.13.20@sha256:1101666385b71f92d2db25025b0a8d3cf5e8bed10029f6033d8da36a7cf5e297

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
