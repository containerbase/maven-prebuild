FROM ghcr.io/containerbase/base:10.11.0@sha256:3a7070ef99fb98145b87b8a610a172afbb7526708cd1a2990c4ea0f12caa1b83

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
