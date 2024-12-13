FROM ghcr.io/containerbase/base:13.4.2@sha256:0f8267aa4fc0a7e99c2475074930abab0bb181d5cb71c2fa434feb35d1afa4a4

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
