FROM ghcr.io/containerbase/base:14.66.4@sha256:277771c67aa2a897241ff785a52c36b8f97227101e94e12682e2531c5de98e55

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
