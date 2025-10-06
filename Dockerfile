FROM ghcr.io/containerbase/base:13.16.0@sha256:4321d65cfa5fcce381fb9c8af9ee829249d45277b08f27cee2b9e7a4d019ea1d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
