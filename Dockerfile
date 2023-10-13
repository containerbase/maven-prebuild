FROM ghcr.io/containerbase/base:9.23.3@sha256:5171c79230d6f4f587cc779f9eacc88132ed52a55c268d6231665bcfe4200e5d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
