FROM ghcr.io/containerbase/base:13.4.4@sha256:39fc1ac128220387458d569b22fd7464ee5a1b19475bca583ec4c232b15e5d1c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
