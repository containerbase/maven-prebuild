FROM ghcr.io/containerbase/base:10.3.11@sha256:d22ed08f962c8adae5a146ca4c37a7711475f64af1da1f9af59f976b289ddecb

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
