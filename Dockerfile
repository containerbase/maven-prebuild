FROM ghcr.io/containerbase/base:13.25.18@sha256:e7d65b5273c4c8298911d6d87d53151912317b1b0494d40bac88641f8ced0138

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
