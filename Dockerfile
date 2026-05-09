FROM ghcr.io/containerbase/base:14.10.4@sha256:eb43d25a56098e58171d7a65a2382b9f8b99097f21e7da82626fe6b5016b0c10

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
