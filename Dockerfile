FROM ghcr.io/containerbase/base:13.8.46@sha256:2718850f952fff28ef8c4ce58416f1dd4fb42a4042020766d5d6ac6e24e61bda

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
