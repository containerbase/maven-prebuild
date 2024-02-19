FROM ghcr.io/containerbase/base:10.1.1@sha256:cdbf93e77063f821855b86ed138070435dfda5aed05b3cf1048e9ba705592a7c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
