# Milestone 2: Custom Distribution Layer

## Goal
Design and implement a custom Yocto distribution that fully controls system-wide features, policies, licensing, and security, while providing reproducible development and release build configurations.

## Tasks Covered
- [x] Create custom distro layer
- [x] Register distro layer in KAS
- [x] Define custom DISTRO name
- [ ] Define and sanitize DISTRO_FEATURES
- [ ] Remove unused default features
- [ ] Validate feature propagation to packages
- [ ] Add switchable init system support (systemd / sysvinit)
- [ ] Validate both init systems build and boot
- [ ] Disable recommended packages globally
- [ ] Control PACKAGE_EXCLUDE globally
- [ ] Define build type variable (dev / release)
- [ ] Apply build type logic globally (not in images)
- [ ] Ensure build type affects optimization, debug, and features
- [ ] Enable CVE checking
- [ ] Validate CVE reports generation
- [ ] Disable GPLv3 packages
- [ ] Generate license manifest
- [ ] Enable build history and build info globally
- [ ] Ensure distro logic does not leak into BSP
- [ ] Ensure distro logic does not leak into images
- [ ] Document distro design decisions

# Implementation
