## [v2.0] - Milestone 2: Custom Distribution Layer
**Status:** Completed
**Date:** 2026-01-31

### Added
- Introduced a custom Yocto distribution layer to centralize system-wide policies
- Added support for selecting the init system (`systemd` or `sysvinit`) via KAS environment variables
- Implemented global development and release build modes
- Enabled CVE vulnerability scanning at the distro level
- Enabled global build history and image build information generation
- Enabled automatic license manifest generation

### Changed
- Sanitized `DISTRO_FEATURES` to remove unused and unnecessary features
- Redirected downloads and shared state cache to shared, host-mounted directories
- Disabled implicit package installation via `RRECOMMENDS`
- Adjusted compiler and packaging behavior based on build typeMilestone 2: Custom Distribution Layer
- Enforced strict separation of policy across distro, BSP, and image layers

### Security
- Excluded GPLv3 and LGPLv3 licensed packages from all builds
- Added build-time visibility into known vulnerabilities through CVE reports

### Build & Reproducibility
- Ensured all images generate traceable build metadata
- Improved build determinism through centralized policy enforcement

### Notes
- All system behavior is now controlled exclusively through the distro layer
- Images and BSP metadata remain free of global policy logic
- Init system and build type can be switched without modifying recipes

---

### Known Limitations
GPLv3 and LGPLv3 license exclusion is temporarily disabled and will be re-enabled once a custom image is introduced and all required packages are replaced with license-compliant alternatives.

### Documentation
- Milestone details: [`docs/milestones/milestone-02.md`](./milestones/milestone-02.md)

---

### Next Milestone
BSP & Machine Control
