FROM ghcr.io/containerbase/base:14.10.5@sha256:a44ba04e30d3e74c0d9dd75b9a28f55045012324f6b30933d8c5fedab7680285

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
