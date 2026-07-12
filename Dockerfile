FROM ghcr.io/containerbase/base:14.12.10@sha256:897c18f748b59d02dd0ba4ae38e27602cbbe8aef8855256cde1a6d12296f4514

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
