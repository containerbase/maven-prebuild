FROM ghcr.io/containerbase/base:9.33.2@sha256:8cb2b5823c0c62f623fe4c491325c0b7d1e513dd24fa4a33e6901f89cc290a37

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
