FROM ghcr.io/containerbase/base:10.3.18@sha256:bb0a91cdc03bcc58c286c86f83602155f47de332b94bfc2ebdcb83edfee45eb3

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
