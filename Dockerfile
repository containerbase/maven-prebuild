FROM ghcr.io/containerbase/base:10.6.5@sha256:f2ce411f0f9c0164f24fab6c9f97f0818b3fad82747aa2e9b14e7a4812606cf0

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
