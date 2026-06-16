FROM ghcr.io/containerbase/base:14.11.4@sha256:53ad1cfcf61e6c6d51fcef4398a47276390086d79e90bc55a4f915c4cdf3f425

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
