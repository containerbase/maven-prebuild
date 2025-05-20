FROM ghcr.io/containerbase/base:13.8.29@sha256:a3f01f407a341fa871620f269c7f6c8151262201ee79e7c19376f425dc7de3f0

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
