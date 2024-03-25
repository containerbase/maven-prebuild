FROM ghcr.io/containerbase/base:10.3.8@sha256:e866d0138ebc94a12e6c770d947c44c83beb31db6a94105d7b1806670e71d78d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
