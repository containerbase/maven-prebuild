FROM ghcr.io/containerbase/base:14.10.6@sha256:3a6cb245a58a33d951b545d3feafabdf9c0f2f63c61b47fbf462b38c3ded92e4

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
