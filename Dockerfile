FROM ghcr.io/containerbase/base:9.24.1@sha256:fb36bb5f67c7c70c5682c3f3e5bde7b13f6f9e482a0e4a231312fc60e3d7aa10

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
