FROM ghcr.io/containerbase/base:13.13.0@sha256:6ba2a71a8d21c48d5055cae7e177382890a48d6b37de47905d5172a28394fddf

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
