FROM ghcr.io/containerbase/base:14.10.0@sha256:9fa84f192de2245fa4e7afaf0188dd4a63b7ec8c02d10604afbf2216c43f0e63

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
