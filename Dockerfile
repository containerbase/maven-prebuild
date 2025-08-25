FROM ghcr.io/containerbase/base:13.10.11@sha256:fdd802425ea9d307f6e6f80eadeddf764f72b5a651dbd03f94fb7cd9e31cfac5

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
