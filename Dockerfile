FROM ghcr.io/containerbase/base:13.8.44@sha256:2fc5ad34e5fe692ac6dd681deab03533faaf0c1deb8d3a24244261fb57346a5a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
