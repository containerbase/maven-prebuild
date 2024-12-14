FROM ghcr.io/containerbase/base:13.4.3@sha256:7915b8f0716a06510bb7e7ea63adbb9628be9da96d63b8cff2e3ed51c615af4f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
