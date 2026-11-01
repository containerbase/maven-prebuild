FROM ghcr.io/containerbase/base:14.59.4@sha256:88f18523902c357e23b9ec99996214e2aec1e79b49fb2fb0681819902f6b496a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
