FROM ghcr.io/containerbase/base:13.8.42@sha256:6d25603bdcd5a179b78a5c9f22a812e5587a21ac365437b06aa87eccfc05c1da

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.15+6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
