FROM ghcr.io/containerbase/base:14.63.0@sha256:1a43239ade55c61da53bedadcafdc1642470fb34d17620f48fe0920ddad38807

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
