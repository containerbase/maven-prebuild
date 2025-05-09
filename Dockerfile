FROM ghcr.io/containerbase/base:13.8.23@sha256:059a63d110f78368f6009036428e9c12b8d3c74d4271c0d8cf7248c99725a898

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
