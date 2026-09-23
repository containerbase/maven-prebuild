FROM ghcr.io/containerbase/base:14.17.2@sha256:1ef8cf748638e98d4eea18de94acb0763e98fe2e43404d48191b111265885cc7

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
