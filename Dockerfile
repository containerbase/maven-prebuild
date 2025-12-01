FROM ghcr.io/containerbase/base:13.25.5@sha256:bb5278925c9693ef3048dc04eb126b5c59a45fcf30da0e53b63cafb77f46f49e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
