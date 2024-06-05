FROM ghcr.io/containerbase/base:10.10.3@sha256:2042006da341b8db281888833207e3acce3885a76bad015bc52be07900ffea74

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
