FROM ghcr.io/containerbase/base:10.6.13@sha256:f504822270555a05ff7ce1aaaa38159cd7f0700c7102bc59a7c19730e36a5459

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
