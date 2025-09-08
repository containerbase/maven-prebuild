FROM ghcr.io/containerbase/base:13.10.20@sha256:8c0be589f3d31a6b2d3087613e5911ed0952ca6005fce69f125f869349a8bc96

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
