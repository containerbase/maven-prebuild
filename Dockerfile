FROM ghcr.io/containerbase/base:14.59.1@sha256:ba9a5cd3b4e15ab467c6d7a15ac159aea369bc727d02931dba6409d3a9a1739e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
