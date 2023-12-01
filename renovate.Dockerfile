#-------------------------
# renovate rebuild trigger
#-------------------------

# makes lint happy
FROM scratch

# renovate: datasource=maven packageName=org.apache.maven:maven
RUN install-tool maven 3.9.6
