FROM ghcr.io/containerbase/base:10.0.1@sha256:d24f4c68845feefe4887bc5f0ad77569f5107b048e55da1ea61282f8e6fd5ad0

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
