# INDI Server Container
[![Build and Push Docker Images](https://github.com/citra-space/indi-docker/actions/workflows/docker-build.yml/badge.svg)](https://github.com/citra-space/indi-docker/actions/workflows/docker-build.yml)

Runs the INDI server with simulated telescope hardware for testing and development.

See [INDI](http://indilib.org/) for more information about the INDI telescope control project.

## Features

- INDI Library 2.1.6+ (from official PPA)
- Simulated CCD camera with realistic star fields (GSC catalog)
- Simulated telescope mount
- Multi-architecture support (amd64, arm64)

## Running the Container

Run the simulator stack:

```bash
docker run -d -p 7624:7624 ehippy/indiserver:latest
```

Connect your INDI client to `localhost:7624`

## Included Simulators

- `indi_simulator_ccd` - CCD camera with GSC star field generation
- `indi_simulator_telescope` - Telescope mount
- `indi_gsc` - Guide Star Catalog interface