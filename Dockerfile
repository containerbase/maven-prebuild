FROM ghcr.io/containerbase/base:14.14.6@sha256:e6208216dc6361995f3bca5b7c345b9be3e7723d45d311c6347376ff8adc8dd2

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
