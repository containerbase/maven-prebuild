FROM ghcr.io/containerbase/base:14.45.0@sha256:ac2098a5cd2dc119c95be5b80df50083754ef5580d916c2a6fbef26585b8f465

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
