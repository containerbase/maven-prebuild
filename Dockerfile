FROM ghcr.io/containerbase/base:14.66.9@sha256:1311db3f04cbb4ff7e8c06468237872e9c1acea1ab6badc38f3e00dc9f931d67

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
