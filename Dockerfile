FROM ghcr.io/containerbase/base:13.13.2@sha256:33ff6f9b3d219c85fc74b05c312fbc1b9d828840b5ea9c9202b13594d3b96ec8

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
