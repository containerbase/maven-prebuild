FROM ghcr.io/containerbase/base:14.36.0@sha256:9c407668c26782f81d77d8e5ec30a8159f0c78d13c8cef1b271b2d5f982526cf

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
