FROM ghcr.io/containerbase/base:13.8.20@sha256:8eb64322e345dd10a7874c88005e3ab80092694acb91fd04f2bd854f81e2ece9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
