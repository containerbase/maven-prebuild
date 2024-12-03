FROM ghcr.io/containerbase/base:13.0.27@sha256:e8feebba3e0017b0b92c93af091138480427f512929731a96875c6b024d275ec

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
