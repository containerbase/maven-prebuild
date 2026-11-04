FROM ghcr.io/containerbase/base:14.63.1@sha256:8255d9fdc1588d3dedcc8f449c8c755283116db92f948d962c83f7c71b126ccc

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
