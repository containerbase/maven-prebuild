FROM ghcr.io/containerbase/base:14.1.3@sha256:6d4bc7fa72cf5502489a06621efaa5db2fc3a023b7845e12bab9ff63831c8663

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
