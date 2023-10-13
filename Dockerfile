FROM ghcr.io/containerbase/base:9.23.2@sha256:a890383584589afa9daf340d61efaea6d3086747e188594510de1c8d8eae464e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
