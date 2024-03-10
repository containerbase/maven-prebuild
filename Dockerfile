FROM ghcr.io/containerbase/base:10.2.4@sha256:5c01098caba1402e2a9fcee108eb44c9e01e0acfbff836fef791dd7833cd1e66

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
