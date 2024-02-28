FROM ghcr.io/containerbase/base:10.2.0@sha256:dc2e06891ec539b59d32e0f684f168ed869b7d329d2aa7c49fa4efe09de38b4a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
