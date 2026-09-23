FROM ghcr.io/containerbase/base:14.17.0@sha256:30cb0ab2dcad8cc85b0c5b2ff3ac23e7fba993020e08316f523ac1048b6d933a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
