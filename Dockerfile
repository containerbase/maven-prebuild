FROM ghcr.io/containerbase/base:14.58.0@sha256:e799bbbd537afdc2fdcc789ac112b3c307cd9a1ffbb2489053336ca5c252be09

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
