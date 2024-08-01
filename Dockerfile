FROM ghcr.io/containerbase/base:11.6.4@sha256:beb7dc135a2cfb4702e6aaa955a5689a10063432400729b76a17cda7500dd021

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
