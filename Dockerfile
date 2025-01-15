FROM ghcr.io/containerbase/base:13.5.10@sha256:20b2d69890a08b6587373db4cc17d513322118bdf7961b96b946dfb55bdfc06f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
