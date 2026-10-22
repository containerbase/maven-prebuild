FROM ghcr.io/containerbase/base:14.51.0@sha256:c3013bce36bfc1a18310e7fddc87ddc27468eb2ac86007ce1f189d93e5a0dabb

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
