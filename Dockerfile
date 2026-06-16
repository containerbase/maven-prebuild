FROM ghcr.io/containerbase/base:14.12.0@sha256:78eef50acdb8a889a413a3aedcd8c07b13f84ce084fae6fb84cc9dc55bbed0d7

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
