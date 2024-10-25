FROM ghcr.io/containerbase/base:13.0.1@sha256:da22a07e329aaaaae8c63db88ea10194f58eabb084f85898763aaecf22d3b575

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
