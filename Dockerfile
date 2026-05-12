FROM ghcr.io/containerbase/base:14.10.10@sha256:e8c5b5a6f23a416c10c659635516db629bbe187e82b4ebe982e6b8d4b87c9bd3

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
