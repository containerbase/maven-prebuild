FROM ghcr.io/containerbase/base:13.26.2@sha256:c756d0acc372c1ab80fda67bfd5ef53fa27516018bab44a9a06d17addee94fea

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.17+10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
