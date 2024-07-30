FROM ghcr.io/containerbase/base:11.3.0@sha256:2b13285e228ab0a4015da45fac3b374795457870bdb8029702c582cb6ecba326

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
