FROM ghcr.io/containerbase/base:14.10.8@sha256:43b66da1f303bcc8a3618c4995768e8aa16fdc824094c9cda509ecbb56a19cae

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
