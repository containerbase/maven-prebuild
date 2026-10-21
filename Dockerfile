FROM ghcr.io/containerbase/base:14.48.0@sha256:80c15165ed1c17cb8ad3a2ab91321d4b75997724e2820d4486ffa1dc9deadb2f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
