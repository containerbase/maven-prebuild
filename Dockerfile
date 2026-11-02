FROM ghcr.io/containerbase/base:14.60.0@sha256:270afb8aec22e3aa2837debb235a2d1b4d4adae63b8bd8a755e24bdc09b190c6

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
