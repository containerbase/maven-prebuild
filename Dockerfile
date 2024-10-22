FROM ghcr.io/containerbase/base:13.0.0@sha256:aafc73427c3869d1cd0e927c80e9549afd75113c129a2c8ef6e4dd70047f9f1a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
