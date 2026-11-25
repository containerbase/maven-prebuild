FROM ghcr.io/containerbase/base:14.69.3@sha256:d998a3bc2f8ccee4394c40ecde8e599a8fa240b782365ca088a23143fe3335c3

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+100000002

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
