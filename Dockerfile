FROM ghcr.io/containerbase/base:13.25.6@sha256:2423db7f08b72f552b9b03a155e8ff953ef7bbe9d767ca219cca859c46781746

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
