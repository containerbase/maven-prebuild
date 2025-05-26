FROM ghcr.io/containerbase/base:13.8.34@sha256:0d748a26b90a180ad706938c3a49467d9c93e736bb5f0a2534ee0e2b496107da

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
