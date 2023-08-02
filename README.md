[![GitHub](https://img.shields.io/badge/GitHub-ForImage-blue.svg?style=social&logo=github)](https://github.com/gha3mi/forimage)
[![Version](https://img.shields.io/github/v/tag/gha3mi/forimage?color=blue&logo=github&style=flat)](https://github.com/gha3mi/forimage/releases)
[![Documentation](https://img.shields.io/badge/ford-Documentation%20-blueviolet.svg)](https://gha3mi.github.io/forimage/)
[![License](https://img.shields.io/github/license/gha3mi/forimage?color=green)](https://github.com/gha3mi/forimage/blob/main/LICENSE)
[![Build](https://github.com/gha3mi/forimage/actions/workflows/ci.yml/badge.svg)](https://github.com/gha3mi/forimage/actions/workflows/ci.yml)

<img alt="ForImage" src="https://github.com/gha3mi/forimage/raw/main/media/logo.png" width="750">

**ForImage**: A Fortran library for reading and writing images.

- [Todo](#todo)
- [fpm dependency](#fpm-dependency)
- [How to run examples](#how-to-run-examples)
- [API documentation](#api-documentation)
- [Contributing](#contributing)

## Todo

- [x] pbm (ASCII/plain)
- [x] pgm (ASCII/plain)
- [x] ppm (ASCII/plain)
- [ ] pbm (binary/raw)
- [ ] pgm (binary/raw)
- [ ] ppm (binary/raw)

Please note that ForImage is currently under development.

## fpm dependency

If you want to use `ForImage` as a dependency in your own fpm project,
you can easily include it by adding the following line to your `fpm.toml` file:

```toml
[dependencies]
forimage = {git="https://github.com/gha3mi/forimage.git"}
```

## How to run examples

**Clone the repository:**

You can clone the `ForImage` repository from GitHub using the following command:

```shell
git clone https://github.com/gha3mi/formatmul.git
```

```shell
cd formatmul
```

To run the examples using `fpm`, you can use response files for specific
compilers:

**For Intel Fortran Compiler (ifort):**

  ```shell
  fpm @ifort
  ```

**For Intel Fortran Compiler (ifx):**

  ```shell
  fpm @ifx
  ```

**For NVIDIA Compiler (nvfortran):**

  ```shell
  fpm @nvidia
  ```

**For GNU Fortran Compiler (gfortran):**

  ```shell
  fpm @gfortran
  ```

## API documentation

The most up-to-date API documentation for the master branch is available
[here](https://gha3mi.github.io/forimage/).
To generate the API documentation for `ForImage` using
[ford](https://github.com/Fortran-FOSS-Programmers/ford) run the following
command:

```shell
ford ford.yml
```

## Contributing

Contributions to `ForImage` are welcome!
If you find any issues or would like to suggest improvements, please open an issue.
