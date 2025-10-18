FROM ghcr.io/containerbase/base:13.23.3@sha256:14f2bd0df5cc37c1a0f2c494cb81ead002b48805a358c6b9964eda6e5ed9c367

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
