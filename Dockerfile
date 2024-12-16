FROM ghcr.io/containerbase/base:13.4.5@sha256:c0b402890bfc22a8c1bb6fd4bd5687397d390d5936fa441f94800a08eadbe273

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
