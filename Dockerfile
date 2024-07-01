FROM ghcr.io/containerbase/base:10.13.0@sha256:ec24fffe654f2f90a499aa1491db83698d040b18a169c113009485d6356c8e0b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
