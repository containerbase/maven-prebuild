FROM ghcr.io/containerbase/base:14.51.1@sha256:0b923f22d26ba1dabcc82c967ac72d0f9d0d0e7b89b591659e75654f269c9a2a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
