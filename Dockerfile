FROM ghcr.io/containerbase/base:14.67.0@sha256:647a13f9816980387af246d731c3d0ec9db4611929d0b7367850250f7f1b261d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
