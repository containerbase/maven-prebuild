FROM ghcr.io/containerbase/base:13.23.17@sha256:b7bedc98c46e80c2a753c1c5aa069d9696200bda607100b7ef9a522c76d578cc

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
