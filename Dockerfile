FROM ghcr.io/containerbase/base:14.15.2@sha256:04525ed6b7e61f56e81948ff3079f2e48ca4a874c6d73369f0b5ad0cbe01dcd4

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
