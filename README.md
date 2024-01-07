[![GitHub](https://img.shields.io/badge/GitHub-ForImage-blue.svg?style=social&logo=github)](https://github.com/gha3mi/forimage)
[![Version](https://img.shields.io/github/release/gha3mi/forimage.svg)](https://github.com/gha3mi/forimage/releases/latest)
[![Documentation](https://img.shields.io/badge/ford-Documentation%20-blueviolet.svg)](https://gha3mi.github.io/forimage/)
[![CI_test](https://github.com/gha3mi/forimage/actions/workflows/CI_test.yml/badge.svg)](https://github.com/gha3mi/forimage/actions/workflows/CI_test.yml)
[![CI_doc](https://github.com/gha3mi/forimage/actions/workflows/CI_doc.yml/badge.svg)](https://github.com/gha3mi/forimage/actions/workflows/CI_doc.yml) 
[![License](https://img.shields.io/github/license/gha3mi/forimage?color=green)](https://github.com/gha3mi/forimage/blob/main/LICENSE)

<img alt="ForImage" src="https://github.com/gha3mi/forimage/raw/main/media/logo.png" width="750">

**ForImage**: A Fortran library for processing and editing PNM images and managing colors.

- [PNM File Support](#pnm-file-support)
- [fpm dependency](#fpm-dependency)
- [How to run examples](#how-to-run-examples)
- [API documentation](#api-documentation)
- [Contributing](#contributing)

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

**Clone the repository:**

Clone the `ForImage` repository from GitHub using the following command:


```shell
git clone https://github.com/gha3mi/forimage.git
```

Navigate to the cloned directory:

```shell
cd forimage
```

### Running `demo_ppm`

The `demo_ppm` program demonstrates various operations on PPM (Portable Pixmap) images. It generates Mandelbrot fractals, performs diverse manipulations, and exports images in the PPM format.

To run `demo_ppm`, execute the following command:

```shell
fpm run --example demo_ppm
```

### Running `demo_color`

The `demo_color` program showcases manipulation of color spaces and their conversions. This program sets a custom color using various methods, converts it to different color spaces, retrieves color values, finds the nearest color, and prints color details.

To run `demo_color`, execute the following command:

```shell
fpm run --example demo_color
```

<!-- To run the examples using `fpm`, you can use response files for specific
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
  fpm @nvfortran
  ```

**For GNU Fortran Compiler (gfortran):**

  ```shell
  fpm @gfortran
  ``` -->

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
