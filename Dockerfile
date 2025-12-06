FROM ghcr.io/containerbase/base:13.25.8@sha256:1e2f3d6e87e9c9c05a963f41ec7609c891b5b4bd35dc9826d57bca4ec82f2422

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
