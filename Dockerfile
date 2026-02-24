FROM ghcr.io/containerbase/base:14.4.7@sha256:c9032170ebe42c7d4b786ca882cd6dabb8ad9c9bbd4702ea12ef9bf724843485

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
