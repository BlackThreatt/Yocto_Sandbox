## [v1.0] - Milestone 1: Project Structure & Reproducibility
**Status:** Completed  
**Date:** 2026-01-25

### Summary
Introduced a fully reproducible, containerized Yocto Project build environment using Docker and KAS.  
This milestone establishes a clean project structure and eliminates host dependency issues, forming a stable foundation for STM32MP1 bring-up.

---

### Added
- Initial project repository structure
- Script to create Docker-based Yocto build environment
- Initial KAS YAML configuration for STM32MP1 target
- Automatic layer fetching and pinning via KAS
- Shared downloads directory (`DL_DIR`)
- Shared sstate-cache directory (`SSTATE_DIR`)
- Build history tracking (`buildhistory`)
- Image build information generation

---

### Build & Deployment Notes
- Yocto Release: scarthgap
- Build Orchestration: KAS
- Container Runtime: Docker
- Target Image: core-image-minimal
- Target Machine: stm32mp15-disco
- Build verified after complete removal of `tmp/`

---

### Known Limitations
- No hardware flashing or runtime validation performed in this milestone
- Build uses `nodistro` and default configuration for now but will be changed in next milestone

---

### Validation
- [x] Build completes successfully inside Docker
- [x] Build is reproducible on a clean host
- [x] Rebuild succeeds after deleting `tmp/`
- [x] Build history and image metadata generated correctly

---

### Documentation
- Milestone details: [`docs/milestones/milestone-01.md`](./milestones/milestone-01.md)

---

### Next Milestone
Distribution Layer Design
