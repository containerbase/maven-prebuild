FROM ghcr.io/containerbase/base:13.23.7@sha256:f66fbc64b8788361e6fc609eef5dc36c1fd183e60ee6d2391d49e07237b30a9c

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
