FROM ghcr.io/containerbase/base:11.11.11@sha256:35a28285bdf54adb610c63ea9e0fbce391b21c8ae7a8aaa3d00629e421a2cc87

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
