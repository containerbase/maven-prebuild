FROM ghcr.io/containerbase/base:13.0.11@sha256:fd35bb6b0e087c93afceb3296c6762c8f58fc4b69700087508fd001a3fda1bcb

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
