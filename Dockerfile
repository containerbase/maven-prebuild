FROM ghcr.io/containerbase/base:13.25.7@sha256:fd6c5334a949c4c01eb2a1b5101781d124d29979ee5e4303be070a40f90c7d0a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
