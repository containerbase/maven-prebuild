FROM ghcr.io/containerbase/base:10.11.6@sha256:227eededf755714cd9e98c9dda94f292f9c6fa81994dbd49fe5a8851d08fba70

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
