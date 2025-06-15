FROM ghcr.io/containerbase/base:13.8.41@sha256:78888c1d58a555a4b98077be3a1dfaaffd01a7db813dd9b00f66e564cf4a5cbc

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
