FROM ghcr.io/containerbase/base:14.6.12@sha256:8616c735746c3551986eb7282fba91038a3846392e4e4c08e983496eedc4ae50

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
