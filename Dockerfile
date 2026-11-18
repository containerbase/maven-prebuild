FROM ghcr.io/containerbase/base:14.67.3@sha256:34e21254d1b62a5f5799f0bc11d89f152d9ce93adb79bb0fd5c82d32416e38b5

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+100000002

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
