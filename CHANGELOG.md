## [v0.7.0](https://github.com/gha3mi/forimage/compare/v0.6.0...v0.7.0) - 2026-03-18


### Features

* feat(cmake): add static/shared install support and fix install rules (#29) ([4b18f213](https://github.com/gha3mi/forimage/commit/4b18f213cdef976b6cd493f49c22efe29fe1e8ed)) by [@gha3mi](https://github.com/gha3mi)

### Fixes

* fix: character length and allocatable outputs for name and hex ([b67debc0](https://github.com/gha3mi/forimage/commit/b67debc06b71b37e55d8f6197d8b6b9c998b2720)) by [@gha3mi](https://github.com/gha3mi)
* fix: avoid transpose in export_pnm() ([dffb8d01](https://github.com/gha3mi/forimage/commit/dffb8d016adb94697da703e79ebf3146336d89c9)) by [@gha3mi](https://github.com/gha3mi)
* fix: add default case to select statements ([a9753518](https://github.com/gha3mi/forimage/commit/a97535185b13ff570c5506cb1dc938beda651104)) by [@gha3mi](https://github.com/gha3mi)
* fix: replace class with type ([56fd4329](https://github.com/gha3mi/forimage/commit/56fd43296879a63ef460a4ce86548cd45057f2fe)) by [@gha3mi](https://github.com/gha3mi)
* fix: replace transpose with reshape in import_pnm ([a21ef6d8](https://github.com/gha3mi/forimage/commit/a21ef6d848fa3e7fbe73a69c02de00e7502870eb)) by [@gha3mi](https://github.com/gha3mi)
* fix: avoid recursion in initialize_colors by direct assignment ([e90d921b](https://github.com/gha3mi/forimage/commit/e90d921bfd2e9e32aa4e88565e709d764c1877f3)) by [@gha3mi](https://github.com/gha3mi)
* fix: deallocate name if allocated to prevent memory leaks ([16e7a5b1](https://github.com/gha3mi/forimage/commit/16e7a5b14fbcccbf52cb5c19df792e79c166c990)) by [@gha3mi](https://github.com/gha3mi)
* fix: optimize memory management in resize, crop, and rotate by using move_alloc ([e9248e78](https://github.com/gha3mi/forimage/commit/e9248e785f7bffaa8c1e1cb9f351000739476c22)) by [@gha3mi](https://github.com/gha3mi)
* fix: correct pixel indexing for average color calculation in PPM format ([907f27cb](https://github.com/gha3mi/forimage/commit/907f27cb56a03581a37bc36bc49496a74cbd5e45)) by [@gha3mi](https://github.com/gha3mi)
* fix: simplify cropping logic by using direct array slicing for pixel extraction ([0ff343e1](https://github.com/gha3mi/forimage/commit/0ff343e1bb2db7d88b1b92501499047a24240086)) by [@gha3mi](https://github.com/gha3mi)
* fix: change write advance option to 'yes' ([c18ea6e9](https://github.com/gha3mi/forimage/commit/c18ea6e97c3399509c477f93dbb6e8742b938ad9)) by [@gha3mi](https://github.com/gha3mi)
* fix: cmake helper function name and include directory ([d7a13985](https://github.com/gha3mi/forimage/commit/d7a139856a16649d9f2f4572ab0f6f862c588240)) by [@gha3mi](https://github.com/gha3mi)

### Others

* docs: fix project_github url in fpm.toml ([8cb38947](https://github.com/gha3mi/forimage/commit/8cb389471cda81e1b2bd7b5a1a559925ae7b13f4)) by [@gha3mi](https://github.com/gha3mi)
* chore: update CI/CD workflow ([c9df8b34](https://github.com/gha3mi/forimage/commit/c9df8b34b28d2e885b7e0c1608cf14eda7f9cfe4)) by [@gha3mi](https://github.com/gha3mi)
* chore: update codecov workflow trigger to main branch ([ed7f2275](https://github.com/gha3mi/forimage/commit/ed7f22756e2f9718b32a27623fb34780df89bd84)) by [@gha3mi](https://github.com/gha3mi)
* chore: add workflow_dispatch trigger to CI/CD workflow ([ce5083eb](https://github.com/gha3mi/forimage/commit/ce5083ebf2ba64428ef2d39def75e3309bfb1b31)) by [@gha3mi](https://github.com/gha3mi)
* chore: update fpm.toml with homepage and copyright year ([d0b0fddf](https://github.com/gha3mi/forimage/commit/d0b0fddfb3a6d0ee935e277e1a17af1dc100911b)) by [@gha3mi](https://github.com/gha3mi)
* avoid transpose in export_pnm ([222b8c22](https://github.com/gha3mi/forimage/commit/222b8c22521c402ea32a0266fb977d9a6480eaa6)) by [@gha3mi](https://github.com/gha3mi)
* improve read_header ([22b31f7e](https://github.com/gha3mi/forimage/commit/22b31f7e064a256d4b468109ab722b191d2b8f25)) by [@gha3mi](https://github.com/gha3mi)
* chore: Update CI/CD workflow ([26ecc860](https://github.com/gha3mi/forimage/commit/26ecc86086d14270e74cb77eec3e54bf38e7dd2e)) by [@gha3mi](https://github.com/gha3mi)
* Update README.md status table [ci skip] (#30) ([f2f8f83d](https://github.com/gha3mi/forimage/commit/f2f8f83d2eace9fd006f2caae6dade79d81b7496)) by [@gha3mi](https://github.com/gha3mi)


### Contributors
- [@gha3mi](https://github.com/gha3mi)



Full Changelog: [v0.6.0...v0.7.0](https://github.com/gha3mi/forimage/compare/v0.6.0...v0.7.0)

## [v0.6.0](https://github.com/gha3mi/forimage/compare/v0.5.1...v0.6.0) - 2025-07-25


### Features

* feat: add Codecov configuration and workflow for coverage reporting ([1d2dbc59](https://github.com/gha3mi/forimage/commit/1d2dbc59f4756820799e6c30f96694613403eeea)) by [@gha3mi](https://github.com/gha3mi)

### Fixes

* fix: guard  `do concurrent` loops for nvfortran ([59028212](https://github.com/gha3mi/forimage/commit/59028212c63c98ec6cb5252a23d6a58a5b83f3d1)) by [@gha3mi](https://github.com/gha3mi)
* fix: update README badges and remove logo image ([e7b51173](https://github.com/gha3mi/forimage/commit/e7b51173300e14fd4f2b8afcabd772eb1118e0a9)) by [@gha3mi](https://github.com/gha3mi)


### Contributors
- [@gha3mi](https://github.com/gha3mi)



Full Changelog: [v0.5.1...v0.6.0](https://github.com/gha3mi/forimage/compare/v0.5.1...v0.6.0)

## [v0.5.1](https://github.com/gha3mi/forimage/compare/v0.5.0...v0.5.1) - 2025-07-22


### Others

* refactor: restrict module usage to only necessary components ([a95eb70b](https://github.com/gha3mi/forimage/commit/a95eb70b794c2acf12254d080371262311071804)) by [@gha3mi](https://github.com/gha3mi)
* refactor: add generic set_pixels ([fd2553c8](https://github.com/gha3mi/forimage/commit/fd2553c8ecd36fcfda1026c8f11336a7c0ed7235)) by [@gha3mi](https://github.com/gha3mi)


### Contributors
- [@gha3mi](https://github.com/gha3mi)



Full Changelog: [v0.5.0...v0.5.1](https://github.com/gha3mi/forimage/compare/v0.5.0...v0.5.1)

## [v0.5.0](https://github.com/gha3mi/forimage/compare/v0.4.0...v0.5.0) - 2025-07-21


### Features

* feat: Add CI configurations for fpm tests across multiple platforms ([f03e63d7](https://github.com/gha3mi/forimage/commit/f03e63d70ead01f1a36557f242ecb23ff813006a)) by [@gha3mi](https://github.com/gha3mi)
* feat: Add release.sh automation script for changelog generation and versioning ([b2ca8291](https://github.com/gha3mi/forimage/commit/b2ca8291cd4536777f1e4ae202afb05ecc0e908b)) by [@gha3mi](https://github.com/gha3mi)
* feat: Add CMake testing job to CI/CD workflow with status generation ([ea06236d](https://github.com/gha3mi/forimage/commit/ea06236dbb87326336cacb9d2a7ab417f94b9d4c)) by [@gha3mi](https://github.com/gha3mi)

### Others

* update README.md status table ([#23](https://github.com/gha3mi/forimage/pull/23)) by [@gha3mi](https://github.com/gha3mi)
* Add Fortitude Linter job to CI/CD workflow ([ca2b6032](https://github.com/gha3mi/forimage/commit/ca2b60325881e24ca88f3af662590fa5ae20cb15)) by [@gha3mi](https://github.com/gha3mi)
* Fix: flang compiler issue by explicitly assigning color components in print subroutine ([5ffbfe73](https://github.com/gha3mi/forimage/commit/5ffbfe739ee06848a78845ccafd3cde871a69a12)) by [@gha3mi](https://github.com/gha3mi)
* style: Clean up whitespace add fortitude to fpm.toml ([aeb37ddb](https://github.com/gha3mi/forimage/commit/aeb37ddbe7b333b26166375d4c232e291d8b43b7)) by [@gha3mi](https://github.com/gha3mi)
* Update README.md status table [ci skip] (#24) ([be1c6eba](https://github.com/gha3mi/forimage/commit/be1c6ebaf6e65f44d3212d78b957d31971ddcb57)) by [@gha3mi](https://github.com/gha3mi)


### Contributors
- [@gha3mi](https://github.com/gha3mi)



Full Changelog: [v0.4.0...v0.5.0](https://github.com/gha3mi/forimage/compare/v0.4.0...v0.5.0)
