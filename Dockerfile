FROM ghcr.io/containerbase/base:13.5.2@sha256:6457c31a4f2770b0fa9651f743ca7c3e988b263b45a8550a7182ca0b1ad21c52

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.13+11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
