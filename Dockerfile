FROM ghcr.io/containerbase/base:14.5.0@sha256:a6b8380f8c17cf3b2cdadfc4c417fa4b368ab24223ae3e2f79e4f7110ce41575

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
