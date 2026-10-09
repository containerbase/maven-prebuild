FROM ghcr.io/containerbase/base:14.30.2@sha256:3e2e08a3fdc75031d6566656ea5605030ca5e5c5dbafc776bc2c33f3a1d3c4e9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
