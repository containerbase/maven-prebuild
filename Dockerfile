FROM ghcr.io/containerbase/base:14.52.1@sha256:099e3a3733ff5abdda9c98ed31164356e605bd4b8c724b6a5668598073c0173d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
