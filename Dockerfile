FROM ghcr.io/containerbase/base:13.25.19@sha256:fbacc0d46a6b1bb65a8df1a21a2beda5e89dd14739ad9e5a6e0cc3def0f21b27

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
