FROM ghcr.io/containerbase/base:14.6.13@sha256:a73dd9860a4a872d9487936af5ef14ccefce28793d10cb21a868106ead6cd06a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
