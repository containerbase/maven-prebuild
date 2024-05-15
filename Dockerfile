FROM ghcr.io/containerbase/base:10.6.10@sha256:3232c9b346833d710b9e73419f4fe1c90dc00c2e501d866f9b045298bc3b6ade

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
