FROM ghcr.io/containerbase/base:9.31.4@sha256:8c51009cd18ea0e5c61fb60e87617f111a5c9fb9bb0570bb7880df93eba5fd43

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
