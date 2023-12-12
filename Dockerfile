FROM ghcr.io/containerbase/base:9.30.3@sha256:32073bcd537963b9abe3b424d96a67fc7d5457e71ca036f7f3db1b9ca2e3afc6

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.9+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
