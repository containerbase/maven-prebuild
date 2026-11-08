FROM ghcr.io/containerbase/base:14.66.11@sha256:69f66c1b55435fda3eec94c6e8ef58b4c5c7ceae53b5155c3d82c7f1270eccbb

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
