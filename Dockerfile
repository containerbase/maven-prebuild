FROM ghcr.io/containerbase/base:14.55.3@sha256:1d389f3c738cb5912cf5d8bdf0a956048f3f6aa7b1993cbd2f1a5273f586b0c1

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
