FROM ghcr.io/containerbase/base:14.53.0@sha256:295eb80a48fe8a2e21911fa382172e29ed336b1e13901d7ad1c4166f720151f1

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
