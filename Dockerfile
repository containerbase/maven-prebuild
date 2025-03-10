FROM ghcr.io/containerbase/base:13.8.5@sha256:e02b2262f2352c31453f1224023fefd068f2865b1a07dadbffb4e21138ef3dd6

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
