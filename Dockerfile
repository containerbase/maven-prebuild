FROM ghcr.io/containerbase/base:13.25.24@sha256:1943eff8ba2978f7d12d259c89d3c404027a4de407817c9a100e4f6c19ba74ff

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
