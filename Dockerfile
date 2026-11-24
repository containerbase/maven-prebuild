FROM ghcr.io/containerbase/base:14.68.4@sha256:091455dbb4507f3e4ff58d1e04c65f37c89c3b514b11156d38eb2f6de0206990

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+100000002

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
