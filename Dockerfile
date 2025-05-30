FROM ghcr.io/containerbase/base:13.8.37@sha256:63e55d7e39f3a3de00357b76f2e1a93054ce65c5b8c9bd816898e877b053706a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
