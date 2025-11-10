FROM ubuntu:24.04
LABEL maintainer="citra-space"

ARG LIBINDI_VERSION=*
ARG INDI_VERSION=*

# Install dependencies and INDI
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && apt-add-repository ppa:mutlaqja/ppa \
    && apt-get update \
    && apt-get install -y \
        libindi1=${LIBINDI_VERSION} \
        indi-full=${INDI_VERSION} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 7624

ENTRYPOINT ["indiserver", "-v"]
CMD ["indi_watchdog", "indi_simulator_ccd", "indi_simulator_dome", "indi_simulator_telescope"]
