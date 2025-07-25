[![GitHub](https://img.shields.io/badge/GitHub-ForImage-blue.svg?style=social&logo=github)](https://github.com/gha3mi/forimage)
[![Version](https://img.shields.io/github/release/gha3mi/forimage.svg)](https://github.com/gha3mi/forimage/releases/latest)
[![Documentation](https://img.shields.io/badge/ford-Documentation%20-blueviolet.svg)](https://gha3mi.github.io/forimage/)
[![Setup Fortran Conda CI/CD](https://github.com/gha3mi/forimage/actions/workflows/CI-CD.yml/badge.svg?branch=main)](https://github.com/gha3mi/forimage/actions/workflows/CI-CD.yml)
[![codecov](https://codecov.io/gh/gha3mi/forimage/graph/badge.svg?token=Q7FKDYKQAB)](https://codecov.io/gh/gha3mi/forimage)
[![License](https://img.shields.io/github/license/gha3mi/forimage?color=green)](https://github.com/gha3mi/forimage/blob/main/LICENSE)

**ForImage**: A Fortran library for processing and editing PNM images and managing colors.

- [PNM File Support](#pnm-file-support)
- [Color Support](#color-support)
- [fpm dependency](#fpm-dependency)
- [How to run demos](#how-to-run-demos)
  - [Using fpm](#using-fpm)
  - [Using CMake](#using-cmake)
- [Projects Utilizing ForImage](#projects-utilizing-forimage)
- [API documentation](#api-documentation)
- [Contributing](#contributing)
- [References](#references)

## PNM File Support

ForImage offers comprehensive support for PNM files, including creation, importing, and exporting capabilities. It seamlessly handles formats such as `PBM`, `PGM`, and `PPM` in both `ASCII` and `binary` representations. 

Available features include:

- Original

<img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/mandelbrot_binary.png" width="400"> 

- Negative

<img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/mandelbrot_binary_negative.png" width="400">

- Brighten

<img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/mandelbrot_binary_brighten.png" width="400">

- Swap Channels

<img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/mandelbrot_binary_swap.png" width="400">

- Remove Channels

<img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/mandelbrot_binary_remove.png" width="400">

- Greyscale

<img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/mandelbrot_binary_greyscale.png" width="400">

- Rotate

<img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/mandelbrot_binary_rotate.png" width="400">

- Flip Horizontal

<img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/mandelbrot_binary_flip_horizontal.png" width="400">

- Flip Vertical

<img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/mandelbrot_binary_flip_vertical.png" width="400">

- Crop

<img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/mandelbrot_binary_crop.png" width="250">

- Resize

<img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/mandelbrot_binary_resize.png" width="250">


## Color Support

ForImage supports different color representations like RGB, CMYK, Decimal, Hexadecimal, HSV, HSL, XYZ, and color names. Users can easily set and retrieve color values, switch between color types, and find the closest matching colors.

<img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/black.png" width="50"><img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/white.png" width="50"><img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/blue.png" width="50"><img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/red.png" width="50"><img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/yellow.png" width="50"><img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/gray.png" width="50"><img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/cyan.png" width="50"><img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/orange.png" width="50"><img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/pink.png" width="50"><img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/gold.png" width="50"><img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/violet.png" width="50"><img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/green.png" width="50"><img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/brown.png" width="50"><img alt="demo" src="https://github.com/gha3mi/forimage/raw/main/png_files/magenta.png" width="50">

## fpm dependency

If you want to use `ForImage` as a dependency in your own fpm project,
you can easily include it by adding the following line to your `fpm.toml` file:

```toml
[dependencies]
forimage = {git="https://github.com/gha3mi/forimage.git"}
```

## How to run demos

The `demo_ppm` program demonstrates various operations on PPM (Portable Pixmap) images. It generates Mandelbrot fractals, performs diverse manipulations, and exports images in the PPM format.

The `demo_color` program showcases manipulation of color spaces and their conversions. This program sets a custom color using various methods, converts it to different color spaces, retrieves color values, finds the nearest color, and prints color details.

To get started, follow these steps:

**Clone the repository:**

Clone the `ForImage` repository from GitHub using the following command:

```shell
git clone https://github.com/gha3mi/forimage.git
```

Navigate to the cloned directory:

```shell
cd forimage
```

### Using fpm

Run the `demo_ppm` example:

```shell
fpm run --example demo_ppm
```

Run the `demo_color` example:

```shell
fpm run --example demo_color
```

### Using CMake

```shell
cmake -B build -D BUILD_FORIMAGE_EXAMPLES=on
```

```shell
cmake --build build
```

Run the `demo_ppm` example:

```shell
./build/example/demo_ppm
```

Run the `demo_color` example:

```shell
./build/example/demo_color
```
Note: The executable must be run from the forimage directory.

## Status

<!-- STATUS:setup-fortran-conda:START -->
| Compiler   | macos | ubuntu | windows |
|------------|----------------------|----------------------|----------------------|
| `flang-new` | - | fpm ✅  cmake ✅ | fpm ❌  cmake ❌ |
| `gfortran` | fpm ✅  cmake ✅ | fpm ✅  cmake ✅ | fpm ✅  cmake ✅ |
| `ifx` | - | fpm ✅  cmake ✅ | fpm ✅  cmake ✅ |
| `lfortran` | fpm ❌  cmake ❌ | fpm ❌  cmake ❌ | fpm ❌  cmake ❌ |
| `nvfortran` | - | fpm ✅  cmake ✅ | - |
<!-- STATUS:setup-fortran-conda:END -->

## Projects Utilizing ForImage

- [ForColormap](https://github.com/vmagnin/forcolormap): A Fortran library for colormaps
- [ForCAD](https://github.com/gha3mi/forcad): A Fortran library for Geometric Modeling using NURBS

If your project utilizes ForImage and you want to be added to this list, please add your project and create a pull request.

## API documentation

The most up-to-date API documentation for the master branch is available
[here](https://gha3mi.github.io/forimage/).
To generate the API documentation for `ForImage` using
[ford](https://github.com/Fortran-FOSS-Programmers/ford) run the following
command:

```shell
ford README.md
```

## Contributing

Contributions to `ForImage` are welcome!
If you find any issues or would like to suggest improvements, please open an issue.

## References

- https://en.wikipedia.org/wiki/Netpbm#File_formats
