# Wiki.js 2.5, the official image pinned by digest, made to run as the
# non-root user Orbit gives every application (10001).
FROM ghcr.io/requarks/wiki:2.5.315@sha256:af71a17dc27ccc4c768591b1c504631ed820d9d13d4e8c325be4232c0035638c

USER root
# Wiki.js writes its cache and uploads under /wiki/data, and its log under /logs.
RUN chmod -R a+rwX /wiki/data /logs
USER 10001

EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 CMD curl -fs http://localhost:3000/healthz || exit 1
CMD ["node", "--no-deprecation", "server"]
