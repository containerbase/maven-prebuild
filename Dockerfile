FROM ghcr.io/containerbase/base:11.11.21@sha256:8ca4b04e33c2af3c5afd0aad219c10c4066518bc8a6de353de411d9f7d97f75a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
