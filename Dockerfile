FROM ghcr.io/containerbase/base:14.12.13@sha256:414e53adc7e5f816237ec7c4bd75ac01d4d374f8f44e00cc0d2996e76421deef

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
