FROM ghcr.io/containerbase/base:13.0.2@sha256:4574112b2763421d7d18d8a44cf6e75a0cb9d4159b6fb0df453be2efa2edd2fe

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
