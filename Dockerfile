FROM ghcr.io/containerbase/base:9.30.9@sha256:e8b28561327a1ca12d693222ece51b8284e65f9e9e5efe2052a42d7f36412ec4

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.9+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
