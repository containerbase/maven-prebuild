FROM ghcr.io/containerbase/base:13.3.0@sha256:1c41abb8eb0ae06d6b10303964bc6f00f4873da1afd5053d9b468128b76e478d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
