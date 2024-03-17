FROM ghcr.io/containerbase/base:10.3.2@sha256:8a50e5059e82ed1c5fb13b191a7855b1d698e0810535207f1bacfb998203edfb

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
