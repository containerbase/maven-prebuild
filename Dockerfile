FROM ghcr.io/containerbase/base:13.5.11@sha256:6b8932b3744c01425f4007a62e2e34f40d00e7804c9d44bba50d88fd50ea31a3

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
