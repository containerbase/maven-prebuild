FROM ghcr.io/containerbase/base:10.13.1@sha256:bad6ed0cc3323117372e7b337339a8a4d4b2a962da463ec1a7baf24ffadc54f4

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
