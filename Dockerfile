FROM ghcr.io/containerbase/base:11.11.29@sha256:d76489614d9a0edf18402fc1e0cf93e7e5578f50f6c3b7d3c6e50a3f74f69512

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
