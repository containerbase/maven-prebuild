FROM ghcr.io/containerbase/base:10.6.17@sha256:bfd489d2f3804862734bd37eb2cb77f55a4dff7d7473f3f76ce36259e8fffba8

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
