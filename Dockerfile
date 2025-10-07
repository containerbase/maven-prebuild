FROM ghcr.io/containerbase/base:13.18.1@sha256:6e73cb6e90a0ada6b5dcf2ad193eb3a83f60b07ee0c7775ed7e02977f02582a2

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
