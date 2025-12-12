FROM ghcr.io/containerbase/base:13.25.13@sha256:d97321d342ba6318ae4e6700c6100e2bd6a8afc7aea2d93a35aa6166fa5a6438

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
