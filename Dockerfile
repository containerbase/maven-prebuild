FROM ghcr.io/containerbase/base:13.8.7@sha256:ba31dc44944a95c1263e6bf102b3ea799ca6c449db5e5ce83ff6f13802a46f1b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
