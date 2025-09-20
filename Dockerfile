FROM ghcr.io/containerbase/base:13.13.9@sha256:abf41bd07f1aecd460395506c26f1c39623ca60fa61f83a3b6684b91a691fea9

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.16+8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
