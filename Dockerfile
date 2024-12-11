FROM ghcr.io/containerbase/base:13.2.3@sha256:3fdf6d6ab9b14779164b30b7291ee65d846cf7e8635ca28b229ba927e965402b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
