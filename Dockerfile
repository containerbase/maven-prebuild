FROM ghcr.io/containerbase/base:11.11.6@sha256:839d6d28eada75d9bfb5b55ba2a0e3e1bb687905bbfce2961f68789509d7380c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
