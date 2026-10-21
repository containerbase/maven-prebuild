FROM ghcr.io/containerbase/base:14.49.0@sha256:0625f0ab0d72622f54faebccbbf1f1e5510d4a38fde36eef60a546715030fe0e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
