FROM ghcr.io/containerbase/base:14.51.2@sha256:c346e2840bb9b8e15445297016bc1b21e5b17350bef689a7a252f3208fd13362

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
