FROM ghcr.io/containerbase/base:14.6.23@sha256:991db029c3f5ff31d7c1ed04217fe3365fc394f3e4f2163eaedcf9cadaf2decc

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
