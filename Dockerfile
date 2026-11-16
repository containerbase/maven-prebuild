FROM ghcr.io/containerbase/base:14.66.27@sha256:5e8fee2869581cd2d227002246f04109ac70aab3562235cc4d2b4eab4f3f48c8

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
