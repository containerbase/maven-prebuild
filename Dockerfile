FROM ghcr.io/containerbase/base:14.66.14@sha256:979631e1e5cd5bcdb8c0a11dc7ff8f668e85b8a7bb5d41f90088fce47ac92ebd

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
