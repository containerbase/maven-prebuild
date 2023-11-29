FROM ghcr.io/containerbase/base:9.25.0@sha256:f0d880fff787b8a67b44f745d111b9336488754e7077903b91c4a761b5aee820

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
