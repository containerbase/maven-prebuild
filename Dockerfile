FROM ghcr.io/containerbase/base:13.26.5@sha256:e79da12a49299dfa704ad77cad29e9cb41457105ea3a1e721128c5a0dae28cfd

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
