FROM ghcr.io/containerbase/base:14.2.0@sha256:b8e896263e35c2ccd126b5d22db192cbcdd72e7dbb1252bfad6652a8ba7e9d1e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
