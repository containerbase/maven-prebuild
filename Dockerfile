FROM ghcr.io/containerbase/base:14.10.15@sha256:3af20b5caefce17dd562c5f1bf213d2cec73379904b31d621bc045c97c7ac944

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
