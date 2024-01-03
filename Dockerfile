FROM ghcr.io/containerbase/base:9.31.2@sha256:ad72c6e101086648ed03712f8b535935e259a539703ebb0b4bf63efcc0e1558a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.9+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
