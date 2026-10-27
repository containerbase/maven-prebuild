FROM ghcr.io/containerbase/base:14.54.0@sha256:0e3e7727d516cbbe7ac2c95121f3e0d5898ab6eab46345747562dd7666c94733

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
