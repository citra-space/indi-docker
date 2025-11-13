FROM ubuntu:24.04
LABEL maintainer="ehippy"

# Install dependencies and INDI
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && apt-add-repository ppa:mutlaqja/ppa \
    && apt-get update \
    && apt-get install -y \
        indi-bin \
        gsc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 7624

ENTRYPOINT ["indiserver", "-v"]
CMD ["indi_simulator_ccd", "indi_simulator_telescope"]