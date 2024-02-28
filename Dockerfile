FROM ghcr.io/containerbase/base:10.2.1@sha256:3173ed233efca8e9cd23da1247e0fefa4430424e5092cba9fc386c859e96cb2a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.10+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
