FROM ghcr.io/containerbase/base:10.14.0@sha256:7df1d9fabb26f1825b3fb5483246d13c5411519e3003511b08e8962779446d58

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
