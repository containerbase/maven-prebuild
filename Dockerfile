FROM ghcr.io/containerbase/base:13.0.13@sha256:16dca9e1eddeb9a2d3b44608f309663eac089cc895bb036c1d71be9d8d0869d7

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
