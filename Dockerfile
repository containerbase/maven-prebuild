FROM ghcr.io/containerbase/base:14.68.0@sha256:6b90a46537d7fb06c6b84b48563091fe011d58135cc105a5b4fa4892c4a2aa01

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+100000002

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
