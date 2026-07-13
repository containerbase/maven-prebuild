FROM ghcr.io/containerbase/base:14.12.11@sha256:9b8924908d4dd8fc0bf47051d3a27db7a835751ec5f4c2bed25fa29202e0733b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
