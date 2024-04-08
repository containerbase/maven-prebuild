FROM ghcr.io/containerbase/base:10.3.12@sha256:d5498f499c2cf918c18165254e0d45309e0f831b3e6fb83f1bca60e619138681

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
