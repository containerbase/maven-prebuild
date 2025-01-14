FROM ghcr.io/containerbase/base:13.5.9@sha256:87c0eaa24464d87d7f2680bd923ee4f3c1c83e7cf9543f7ba004490bb1f39d09

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
