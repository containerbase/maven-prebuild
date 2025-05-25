FROM ghcr.io/containerbase/base:13.8.33@sha256:42b15981c30c8839cac4be2bcbfc61f479d4fc9e7686f1297341ad55ba10e3fc

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
