FROM ghcr.io/containerbase/base:10.8.0@sha256:d4f59337015b5720b3700eb8c3b7c7a4e709fb6f1f39d6809847341ea32a3333

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
