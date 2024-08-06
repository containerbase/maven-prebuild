FROM ghcr.io/containerbase/base:11.9.0@sha256:3137d18444cb7d3ef0427046d6802a53d2b75c9327fa70a6461646935026e802

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
