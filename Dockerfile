FROM ghcr.io/containerbase/base:14.18.3@sha256:77758615621029aa4eda8e1797d459b4cbc64b1a92da71005635bd85a3405220

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
