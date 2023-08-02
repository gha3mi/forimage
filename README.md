# ForImage

A Fortran library for reading and writing images.

![ForImage](media/logo.png)

- [ForImage](#forimage)
  - [Todo](#todo)
  - [Installation](#installation)
    - [fpm](#fpm)
  - [Documentation](#documentation)
  - [Running examples](#running-examples)
  - [Contributing](#contributing)

## Todo

- [x] pbm (ASCII/plain)
- [x] pgm (ASCII/plain)
- [x] ppm (ASCII/plain)
- [ ] pbm (binary/raw)
- [ ] pgm (binary/raw)
- [ ] ppm (binary/raw)

Please note that ForImage is currently under development.

## Installation

### fpm

ForImage can be cloned and then built using
[fpm](https://github.com/fortran-lang/fpm), following the instructions provided
in the documentation available on Fortran Package Manager.

```shell
git clone https://github.com/gha3mi/forimage.git
cd forimage
fpm install --perfix .
```

Or you can easily include this package as a dependency in your `fpm.toml` file.

```toml
[dependencies]
forimage = {git="https://github.com/gha3mi/forimage.git"}
```

## Documentation

To generate the documentation for the `ForImage` module using
[ford](https://github.com/Fortran-FOSS-Programmers/ford) run the following
command:

```shell
ford ford.yml
```

## Running examples

To run the examples using `fpm`, you can use response files for specific
compilers:

- For Intel Fortran Compiler (ifort):

  ```shell
  fpm @ifort
  ```

- For Intel Fortran Compiler (ifx):

  ```shell
  fpm @ifx
  ```

- For NVIDIA Compiler (nvfortran):

  ```shell
  fpm @nvidia
  ```

- For GNU Fortran Compiler (gfortran):

  ```shell
  fpm @gfortran
  ```

## Contributing

Contributions to ForImage are welcome!
