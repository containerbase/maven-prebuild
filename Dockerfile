FROM ghcr.io/containerbase/base:10.7.1@sha256:d5ad0af6249b6e26911154495a6e0af2ac9a54e952c5db2af4c47d3f65800c66

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
