FROM ghcr.io/containerbase/base:13.8.54@sha256:824592e21a2e9420e4ac2b26850604e0a5ffd717d09cc7cf1ff5edade9d0034b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
