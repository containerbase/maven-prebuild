FROM ghcr.io/containerbase/base:10.10.2@sha256:c092646c8047cf385d8cea997fa2e43ea877c3d8f918d02ed20e6429c06cfc3a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
