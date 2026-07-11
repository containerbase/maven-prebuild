FROM ghcr.io/containerbase/base:14.12.9@sha256:8a4f204c7aaa0b1a3eda4387e456c64e12513119638879d8353972c4fe77bc4e

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
