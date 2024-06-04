FROM ghcr.io/containerbase/base:10.8.1@sha256:ef7a1fdc7848c1a650d331359431ae82c87d17adb55f31677ecee4780f4a9bec

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
