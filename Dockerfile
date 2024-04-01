FROM ghcr.io/containerbase/base:10.3.9@sha256:f6984b7e337407853c27b36c0f2b955edeb41d0f5d94d60e33cea930b6a17225

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
