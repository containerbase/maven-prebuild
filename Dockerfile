FROM ghcr.io/containerbase/base:14.59.0@sha256:88013d3d2c88ecfe9e44eaaa22ee771cefb3a51117002cbc073b9a95a8f969da

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
