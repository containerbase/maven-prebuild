FROM ghcr.io/containerbase/base:10.11.1@sha256:861ebb2016810500ce1709ffcaf04704afb176e5539f3c561708062f53b1c88e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
