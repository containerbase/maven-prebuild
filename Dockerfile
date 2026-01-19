FROM ghcr.io/containerbase/base:14.0.0@sha256:c0cbd6d8b5fbaf5e596859e7a683d939a92b73e5839935f0b8c42316906fae95

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
