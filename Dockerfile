FROM ghcr.io/containerbase/base:13.8.48@sha256:5a9fc85a657efb45bf77656a2ab641fa3b507dda62d2e648e5ade2d555ba4d23

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
