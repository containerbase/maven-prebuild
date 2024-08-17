FROM ghcr.io/containerbase/base:11.11.3@sha256:65f43130053d6e1d2915528a3d5dfe2143e0a3ad17b1ab0f1d4ade1aafb26b00

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
