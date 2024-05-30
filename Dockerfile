FROM ghcr.io/containerbase/base:10.6.19@sha256:d943d4941e043013f0efdb90324f12db3ad4abcb417da45d16ccb9e55172af9b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
