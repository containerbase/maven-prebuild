FROM ghcr.io/containerbase/base:14.66.25@sha256:f4ec8a2ec66b6098b5b2fc8411043182d767584534977576524779def24c38ca

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
