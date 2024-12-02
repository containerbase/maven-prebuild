FROM ghcr.io/containerbase/base:13.0.25@sha256:703d5833b6625642ecd2122a702b427e2bcb187d63bc83bc482fa0b3f80e6f81

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
