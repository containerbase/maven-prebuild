#-------------------------
# renovate rebuild trigger
#-------------------------

# makes lint happy
FROM scratch

# renovate: datasource=maven packageName=org.apache.maven:apache-maven
RUN install-tool maven 3.9.13
