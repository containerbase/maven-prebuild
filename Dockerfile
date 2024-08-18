FROM ghcr.io/containerbase/base:11.11.5@sha256:8bf3cd0de89656c19ce0bb9ce5202a57256f3a72bfa54001faf07e2f92f4e000

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
