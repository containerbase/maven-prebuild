FROM ghcr.io/containerbase/base:9.20.13@sha256:9d5c018646811190c6eae482ac7d8be90f3817378903f57b3fe6d9616e7fe8f4

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
