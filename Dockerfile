FROM ghcr.io/containerbase/base:14.66.20@sha256:3971d420e05e89ff94a4ff33fc91e44445717eadb5716e321d5ffd0ac2d68090

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
