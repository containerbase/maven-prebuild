FROM ghcr.io/containerbase/base:13.5.6@sha256:64cad7a020da9e0fb6b3496fade83216714513dc42cd3128b6328c5d15d7c5a8

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
