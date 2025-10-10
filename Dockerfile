FROM ghcr.io/containerbase/base:13.18.3@sha256:6dce3dfd7a3e1a3913e49199a91a2a336938dcd70919c8dfdd754feb9b0c4e21

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
