FROM ghcr.io/containerbase/base:14.69.1@sha256:c985f103e60725b00c4a52506a94367275600e9cbd1bd8bb315a27f73688b981

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+100000002

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
