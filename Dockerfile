FROM ghcr.io/containerbase/base:13.8.18@sha256:bdf6f80a5c5bc64a2b1ab6d31745086d57d7b11103da32a98ed81852d24f62fa

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
