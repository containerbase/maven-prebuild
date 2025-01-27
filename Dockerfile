FROM ghcr.io/containerbase/base:13.7.2@sha256:75f08add5b90da955d341b2cd95759b744554e4f2b253e85fe79fed3517c5a6d

# required to test maven
# TODO: only lts
# renovate: datasource=java-version
RUN install-tool java-jre 17.0.14+7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
