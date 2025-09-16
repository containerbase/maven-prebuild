FROM ghcr.io/containerbase/base:13.13.3@sha256:925fa6770b93ac5d18306f086e6b08fd1e8e351c1384518c83ce087afec85ffa

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
