FROM ghcr.io/containerbase/base:13.0.9@sha256:7dea2662f0dc38887d055c9c588a84355d8db74f11a2d651e3cc32aee33f87f7

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
