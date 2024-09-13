FROM ghcr.io/containerbase/base:11.11.15@sha256:5b000c9e31ee4d55ceac1caaf5acd39617441fa35075fdd82bdd40b8c32a7ac7

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
