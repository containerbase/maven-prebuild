FROM ghcr.io/containerbase/base:14.59.5@sha256:1536da7dfe4f3ddb19c379168b391f08eea3531748979166165b13904164f6e1

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
