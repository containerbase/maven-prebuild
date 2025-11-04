FROM ghcr.io/containerbase/base:13.23.18@sha256:4b2273bdc681f027d7c325d68eaf0ef4177bc98270ba671a4861dcc950ee9b55

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
