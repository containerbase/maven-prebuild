FROM ghcr.io/containerbase/base:10.6.12@sha256:c25753ff3b22b70bb4f3b3420dd833142ce258370eddaae465c5cab199fb07a7

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
