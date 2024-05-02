FROM ghcr.io/containerbase/base:10.6.0@sha256:d333c18082018277eb616c92b0bec17d6b9d57a7f48629da5072a297d3179f2a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
