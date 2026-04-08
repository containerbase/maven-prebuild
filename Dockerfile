FROM ghcr.io/containerbase/base:14.6.16@sha256:93f2ac4559d66d5e0a0c7a8168b597d71fa83e616d903b3cd66fb437ef5ec6e8

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.18+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
