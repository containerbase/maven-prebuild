FROM ghcr.io/containerbase/base:14.30.1@sha256:5634e9236b1848031671a49b3c17e2f29689e68b8d42427cac403168cdb1997f

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
