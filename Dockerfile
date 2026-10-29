FROM ghcr.io/containerbase/base:14.57.0@sha256:776c077dd0534c22637fd7d8426533e56e8b616d9b4c555f1ca96bc6a08f853a

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.21+9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
