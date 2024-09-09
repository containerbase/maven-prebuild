FROM ghcr.io/containerbase/base:11.11.12@sha256:42469cfb8f6d7fd2fe49a56b7361a3b74c74ee4e261983068cc0ffa33e6fdf48

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
