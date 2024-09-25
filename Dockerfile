FROM ghcr.io/containerbase/base:11.11.25@sha256:5217b071d517ade0b0a8f9d38f2477baf34ecd0c15c2d96443cda414908ae039

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
