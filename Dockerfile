FROM ghcr.io/containerbase/base:13.8.53@sha256:ca91307a174c10bb3e82f9fe269993e3c8174b0aee77077f3cd4e4c38565d009

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
