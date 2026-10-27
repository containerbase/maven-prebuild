FROM ghcr.io/containerbase/base:14.55.0@sha256:d873d3a7943fea99e5f7b4d434e0ea9780bbaad508836c22016f5e499d85dd50

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
