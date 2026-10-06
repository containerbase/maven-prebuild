FROM ghcr.io/containerbase/base:14.28.0@sha256:e2e3892c415aaf7068b7625e223141f61fb7667379d8fbe72dfc10e0924507da

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
