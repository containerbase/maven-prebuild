FROM ghcr.io/containerbase/base:9.27.0@sha256:3b7f1a59408a047977b55fe08fd44c89b36b5f4ccbe04aaf38d9ff1a2f835bcf

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.9+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
