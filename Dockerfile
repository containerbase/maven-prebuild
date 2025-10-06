FROM ghcr.io/containerbase/base:13.17.0@sha256:ad28a6c7ddc30f3695453bbab1ac4983b1b881956da08a35a2dd5e4a23f2a4a3

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
