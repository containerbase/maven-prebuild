FROM ghcr.io/containerbase/base:13.25.17@sha256:8539dc9e33f49dc3c1f6ac4ccdd73de69cb92fde5f90e204c6256447a5a0b61f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
