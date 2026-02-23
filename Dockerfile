FROM ghcr.io/containerbase/base:14.4.4@sha256:0f4e46c22c90c27cd6f45599f73898a4eb485f6e8c8e9a2461f987fad235fd18

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
