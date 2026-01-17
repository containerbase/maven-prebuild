FROM ghcr.io/containerbase/base:13.26.4@sha256:f5f4a7010d9ab7045d5717d04168db411c453e0504fce8084590206d1dc3eabc

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
