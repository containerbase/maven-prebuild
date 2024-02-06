FROM ghcr.io/containerbase/base:9.33.4@sha256:6871a164ce812be2bfb559cec08dadbfa409391f793d7bdbce6692fa787d6214

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
