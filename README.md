# ForImage

A Fortran library for reading and writing images.

![ForImage](media/logo.png)

- [ForImage](#forimage)
   - [Todo](#todo)
   - [How to Use ForImage](#how-to-use-forimage)
      - [Installation](#installation)
      - [Adding ForImage as an fpm Dependency](#adding-forimage-as-an-fpm-dependency)
   - [Running Examples](#running-examples)
   - [API Documentation](#api-documentation)
   - [Contributing](#contributing)

## Todo

- [x] pbm (ASCII/plain)
- [x] pgm (ASCII/plain)
- [x] ppm (ASCII/plain)
- [ ] pbm (Binary/raw)
- [ ] pgm (Binary/raw)
- [ ] ppm (Binary/raw)

Please note that ForImage is currently under development.

## How to Use ForImage

### Installation

To use ForImage, follow the steps below:

- **Clone the repository:**

   You can clone the ForImage repository from GitHub using the following command:

   ```shell
   git clone https://github.com/gha3mi/forimage.git
   cd forimage
   ```

- **Build using the Fortran Package Manager (fpm):**

   ForImage can be built using [fpm](https://github.com/fortran-lang/fpm).
   Make sure you have fpm installed, and then execute the following command:

   ```shell
   fpm install --prefix .
   ```

### Adding ForImage as an fpm Dependency

If you want to use ForImage as a dependency in your own fpm project,
you can easily include it by adding the following line to your `fpm.toml` file:

```toml
[dependencies]
forimage = {git="https://github.com/gha3mi/forimage.git"}
```

## Running Examples

To run the examples using `fpm`, you can utilize response files for specific compilers:

- **Intel Fortran Compiler (ifort):**

  ```shell
  fpm @example-ifort
  ```

- **Intel Fortran Compiler (ifx):**

  ```shell
  fpm @example-ifx
  ```

- **NVIDIA Compiler (nvfortran):**

  ```shell
  fpm @example-nvidia
  ```

- **GNU Fortran Compiler (gfortran):**

  ```shell
  fpm @example-gfortran
  ```

## API Documentation

To generate the API documentation for the `ForImage` module using
[ford](https://github.com/Fortran-FOSS-Programmers/ford) run the following
command:

```shell
ford ford.yml
```

## Contributing

Contributions to ForImage are welcome!
