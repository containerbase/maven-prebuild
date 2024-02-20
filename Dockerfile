FROM ghcr.io/containerbase/base:10.1.2@sha256:4c64cb0c47d75836e0b34ac61e1d108a4035b3abe2b5490db172d9599d0ee023

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
