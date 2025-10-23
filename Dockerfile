FROM ghcr.io/containerbase/base:13.23.9@sha256:8f0470a0c68b18fddf6e8c16d09c1f32bb709702c16f89f0ecbef1bad1197817

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
