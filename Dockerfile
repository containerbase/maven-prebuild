FROM ghcr.io/containerbase/base:11.4.0@sha256:6d17e17388fbf6f93c887ca87fb48680570309f87f670fee2eba6bf047df2389

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.12+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
