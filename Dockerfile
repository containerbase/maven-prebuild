FROM ghcr.io/containerbase/base:10.6.6@sha256:406922d90a919e8e4687db799dac3cd9ba58dec7fa1de67a67d97466a70d2b8a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
