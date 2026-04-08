FROM ghcr.io/containerbase/base:14.6.18@sha256:fef9f980e4e7eb2900e42d2e8f21f38762cf4ab0ab6a3691e2d230e98a340bb6

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
