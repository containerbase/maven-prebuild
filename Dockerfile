FROM ghcr.io/containerbase/base:14.56.1@sha256:fd71caad82ca393415902b4c7f294fc51668b8800524117ee75d5317dff52ee9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
