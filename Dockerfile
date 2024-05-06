FROM ghcr.io/containerbase/base:10.6.3@sha256:0ecef01e73000552f75bf0b90340abb245da29aca378a2f6c07ca7b75a03f96e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
