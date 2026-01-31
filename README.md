# Yocto Sandbox: From Zero to Production

This repository documents a complete Yocto Project journey, from a reproducible build environment to a secure, production-ready embedded Linux system. Progress is tracked using GitHub Milestones created as Issues.

The goal is **clarity, reproducibility, and long-term maintainability**.

## Project Goals

- Reproducible Yocto builds
- Hardware-agnostic project structure
- Clean separation of BSP, distro, and project logic
- Production-grade update and security strategy

## Repository Structure

```text
Yocto_Sandbox/
├── docker/
│   └── start_container.sh
├── docs/
│   ├── assets/
│   ├── milestones/
│   │   └── milestone-01.yml
│   └── CHANGELOG.md
├── kas/
│   ├── include/
│   │   ├── common.yml
│   │   ├── local.yml
│   │   ├── oe.yml
│   │   └── stm32mp.yml
│   └── kas-core-image-minimal-stm32mp15.yml
├── meta-sandbox-bsp/
├── meta-sandbox-distro/
├── meta-sandbox-project/
└── README.md
```

## Milestone Progress

### Milestone 1: Reproducible Build Environment

**Status**: Completed

[Milestone-01 notes](docs/milestones/milestone-01.md)

### Milestone 2: Custom Distribution Layer

**Status**: Completed

[Milestone-02 notes](docs/milestones/milestone-02.md)

## Target

- STM32MP157C-DK2

## Build Instructions

To build this project, first clone the repository and enter the project directory:

```bash
git clone https://github.com/BlackThreatt/Yocto_Sandbox.git 
cd Yocto_Sandbox
```

The build is performed using a Docker-based workflow.
Run the start_container.sh script located in the docker directory, specifying the desired command as shown below:

```text
USAGE: ./start_container.sh checkout|build|shell YAML_FILE SHARED_YOCTO_LOCATION
```

**Notes:**

- `YAML_FILE` specifies the KAS configuration to use.
- `SHARED_YOCTO_LOCATION` is a shared directory for downloads and sstate cache to speed up builds across runs.

**Example**

The following example builds the image using a KAS configuration file and a shared Yocto download/cache directory:

```bash
./start_container.sh build ../kas/kas-core-image-minimal-stm32mp15.yml /path/to/shared/yocto/location
```
