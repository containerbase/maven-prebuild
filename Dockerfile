FROM ghcr.io/containerbase/base:14.10.16@sha256:ba01c5085693d7cd31b473b56d3190ecbe8d626ef901c9ed515ee4b749f4a01f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
