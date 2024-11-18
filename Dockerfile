FROM ghcr.io/containerbase/base:13.0.21@sha256:8cec719c080fca375692439d7ac459a18fba433f65a0346edbaaec5bc50e1c0f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
