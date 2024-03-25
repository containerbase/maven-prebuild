FROM ghcr.io/containerbase/base:10.3.7@sha256:b248c27f18a4f844bc0e86dc2ce60e36250ebd188625dfa4e41f7d34e828e8bc

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
