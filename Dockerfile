FROM ghcr.io/containerbase/base:14.6.17@sha256:eec8acbb0bc840962127caaf9512e3511ea3ab3638b9403efd7c4971d9d21f2c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
