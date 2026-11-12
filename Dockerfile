FROM ghcr.io/containerbase/base:14.66.19@sha256:d158862ea11c78bcd235760cb54c2d23ceea9d580a06b771b87b93dd84b004de

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
