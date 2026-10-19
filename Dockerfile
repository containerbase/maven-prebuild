FROM ghcr.io/containerbase/base:14.44.0@sha256:ef358c45da28f32a73490091a38d5731492812aeea5b57b9aeb6c60a9c5255d2

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
