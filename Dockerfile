FROM ghcr.io/containerbase/base:9.23.10@sha256:500fe665605b6bcad30014bff345c56c6bdb1c148ae79d4ac56f84a9c046edfd

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 11.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
