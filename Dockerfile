FROM ghcr.io/containerbase/base:13.8.36@sha256:e6a36fd4c7e9458b64e0b92f7c28c937aa4cb52598bb770034012c635a4de4e4

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
