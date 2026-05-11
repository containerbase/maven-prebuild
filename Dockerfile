FROM ghcr.io/containerbase/base:14.10.9@sha256:84055e6df0bddc285b73576e2f68cd7dd30f89f2a1eff6404d53ecccd476866f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.19+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
