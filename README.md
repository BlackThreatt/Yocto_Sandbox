# Yocto Sandbox

This repository serves as a sandbox environment for experimenting with and documenting various Yocto Project configurations and workflows.

## Project Structure

- **Docker**  
  Contains Bash script to set up the development and build environment. It serves as a mean 

- **kas**  
  Contains KAS build configurations for Yocto images (currently targeting STM32MP15).

- **meta-sandbox-bsp**  
  Board Support Package (BSP) layer for sandboxed hardware experiments.

- **meta-sandbox-distro**  
  Custom distribution layer for sandbox testing.

- **meta-sandbox-project**  
  Project-specific recipes, configurations, and overrides.

- **README**  
  Project documentation and usage instructions.
## So it begins...

- [x] Create an initial KAS configuration to download the required layers for STM32MP15
- [x] Create an initial Docker script to set up the KAS working environment, install layers for the selected YAML configuration, and spawn an interactive shell in the build environment (could use improvement)
- [ ] Set up the initial distribution configuration
