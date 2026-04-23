FROM ghcr.io/containerbase/base:14.8.0@sha256:0242cedae39637f1cedf9a11ad713a35af16f2937cc44d647997353f7d9572a0

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
