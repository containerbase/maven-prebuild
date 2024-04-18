FROM ghcr.io/containerbase/base:10.3.15@sha256:9f70b4724102a6ebef8f25021e5d58c3fbf3fed26191c31cc6fc13e085afbb2b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
