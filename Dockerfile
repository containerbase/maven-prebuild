FROM ghcr.io/containerbase/base:14.59.2@sha256:bb019b8f49a5eab09254e41bf0d982a3690e98aeda9593287f407a4352b072a0

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
