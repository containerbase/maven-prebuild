FROM ghcr.io/containerbase/base:13.7.6@sha256:5668bd25f06e684c89073ebb935ad82c92ba9b25147ec12580c0c4b5ef687134

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
