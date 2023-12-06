FROM ghcr.io/containerbase/base:9.30.0@sha256:e0cfc6f69790e6f1effeb4d83c7872d8752202088b47dde4848405c8710cc677

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.9+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
