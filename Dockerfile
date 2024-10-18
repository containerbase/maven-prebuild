FROM ghcr.io/containerbase/base:12.0.7@sha256:f6dc1a4b29c4bef61fb33eea223a955d16be356cabce58ba86fad7709c50d817

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
