FROM ghcr.io/containerbase/base:14.13.0@sha256:62288195ccbeeedea2ae89327ec69ff37b02dee483c4bb822be164e76413f219

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
