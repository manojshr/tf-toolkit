ARG TF_VERSION=1.11.4
FROM hashicorp/terraform:${TF_VERSION}

# directories
RUN mkdir /scripts
RUN mkdir /terraform

# copy your entrypoint
COPY scripts/ /scripts/

WORKDIR /terraform

ENTRYPOINT ["/scripts/entrypoint.sh"]
