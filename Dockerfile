FROM ghcr.io/containerbase/base:14.64.0@sha256:3c15a62b58c102aef3960a6f65bc97b269fa0f6981bbb119d4d1836cdfc3facc

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
