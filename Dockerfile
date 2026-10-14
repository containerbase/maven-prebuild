FROM ghcr.io/containerbase/base:14.38.0@sha256:996d6e23c0eb3f712d127543d73fef84f1dd7997b9f57b929f29c421a3c19e1e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
