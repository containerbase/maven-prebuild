FROM ghcr.io/containerbase/base:13.0.12@sha256:13ed2c3aff01073f365a8a71a9caa4a1a28e0e133773804687cbd073383453b0

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
