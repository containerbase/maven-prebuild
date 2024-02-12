FROM ghcr.io/containerbase/base:9.33.8@sha256:6def053e3b358b900d377affdbd0d64fad0e5b0ecbedc0773545a432a5fc5e26

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
