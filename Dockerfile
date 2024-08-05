FROM ghcr.io/containerbase/base:11.6.6@sha256:7466b1223db1edf49580ca1cec5c81394739748f18598028ac2099f0e2ef4dbf

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
