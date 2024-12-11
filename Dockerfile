FROM ghcr.io/containerbase/base:13.4.0@sha256:632b07d4a7c0019be8bb7b7b22d551bc3d574a25054ee12ce16950652db9789a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
