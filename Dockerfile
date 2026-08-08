FROM ghcr.io/containerbase/base:14.13.18@sha256:32bd7f74ca9e59db869f8f8fc5470c0da6f606b65031bafe7af12de33d80eb0a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
