FROM ghcr.io/containerbase/base:10.15.4@sha256:42aa7bcc9eb13f4620225dd131fc4288dec0aef095bf7044816bfbc7b3c6f911

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.11+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
