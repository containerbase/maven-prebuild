FROM ghcr.io/containerbase/base:9.20.12@sha256:c2a0548b8f6a7fa82ca08586b7298fe05b8be5badcd94096cb2d4f88961c40e5

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
