FROM ghcr.io/containerbase/base:13.13.12@sha256:e746df1a32cfcda57f689ac4793dfbca5bec27d17e5562f3c77d5eba5bd098f6

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
