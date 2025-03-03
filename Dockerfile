FROM ghcr.io/containerbase/base:13.8.4@sha256:ff6cce683adb490f9a55c3d02e9ace6d1044987a8747f5b3dd58eef2ab341dc9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
