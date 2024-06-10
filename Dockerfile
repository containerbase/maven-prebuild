FROM ghcr.io/containerbase/base:10.11.3@sha256:5fa9d9e1b9656c75d5f87f41f4e9cad55068e407c21509de5c32b27338b7edf3

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
