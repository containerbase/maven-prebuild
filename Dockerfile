FROM ghcr.io/containerbase/base:14.10.26@sha256:1c28ea278dd160efbef98ba54f1c58c69aac2a37d21f5efa72bec40eb1a16eea

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
