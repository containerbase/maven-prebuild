FROM ghcr.io/containerbase/base:14.19.0@sha256:5c2c27977528d01ecb9b790202e2474f58764cdc814fab8ec076741262eb8a89

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
