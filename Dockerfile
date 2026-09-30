FROM ghcr.io/containerbase/base:14.22.0@sha256:4471600a646738416f4491bf451bb6b356e0bdc87702ea99a4eada843cd3342b

# required to test maven
# TODO: only lts
# renovate: datasource=java-version packageName=java-jre?os=linux&architecture=x64
RUN install-tool java-jre 17.0.20+101

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=maven

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
