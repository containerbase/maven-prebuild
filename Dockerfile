FROM ghcr.io/containerbase/base:11.6.0@sha256:dfa1770c45ddce16f755c0cd424c6b36c8ff705c636150587d527dfea02059e3

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
