FROM ghcr.io/containerbase/base:13.2.4@sha256:0ab5b37afe63a2a65ea47a2fd9cc7f0d95ae775d79459913538311acaf60f6e6

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
