FROM ghcr.io/containerbase/base:14.14.5@sha256:72ef57cb224c7868e22a6b068d71b1ec538926fe1fcfc6a561d9821d14cc81ff

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
