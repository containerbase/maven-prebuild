FROM ghcr.io/containerbase/base:13.20.6@sha256:24c64e916085b6670848013059abe8290cce6c99f26aa2eca036492a6a2abe02

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
