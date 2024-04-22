FROM ghcr.io/containerbase/base:10.3.16@sha256:53e15cc9c5b3d509cd24168cb3f5aca03be66a08f2668fc80ee6d75b661e69bb

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
