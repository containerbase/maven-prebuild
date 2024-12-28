FROM ghcr.io/containerbase/base:13.5.4@sha256:52778caebf07b8accafad75a4daa0363e291ccc7d6cad19bf17bc2dcf274302c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
