! Description: This program showcases different operations on PPM (Portable Pixmap) images.
! It generates a Mandelbrot fractal, performs manipulations, and exports images in PPM format.

program demo_ppm

   use forimage, only: format_pnm, rk, ik
   implicit none

   ! Declare format_pnm object and parameters for image dimensions
   type(format_pnm)    :: image, copy_image
   integer, parameter  :: height = 400
   integer, parameter  :: width  = 400
   integer(ik)         :: px(height, 3*width)

   ! Generate Mandelbrot fractal and assign pixel values
   px = mandelbrot(height, width)

   ! Set the properties of the format_pnm object (encoding, file format, width, height, max_color, comment and pixels)
   call image%set_pnm(&
      encoding    = 'binary', &
      file_format = 'ppm', &
      width       = width, &
      height      = height, &
      max_color   = 255, &
      comment     = 'demo: mandelbrot', &
      pixels      = px &
      )

   ! Print information about the image
   call image%print_info()

   ! Export the image to a PPM file
   call image%export_pnm('pnm_files/mandelbrot_binary')

   ! Export the image to a PPM file with ascii encoding
   call image%export_pnm('pnm_files/mandelbrot_ascii', 'ascii')

   ! Export the image to a PPM file with a different encoding
   copy_image = image ! Copy the format_pnm object
   call copy_image%negative()
   call copy_image%export_pnm('pnm_files/mandelbrot_binary_negative', 'binary')
   call copy_image%finalize()

   ! Brighten the image
   copy_image = image ! Copy the format_pnm object
   call copy_image%brighten(100)
   call copy_image%export_pnm('pnm_files/mandelbrot_binary_brighten', 'binary')
   call copy_image%finalize()

   ! Swap the red and blue channels
   copy_image = image ! Copy the format_pnm object
   call copy_image%swap_channels('rb')
   call copy_image%export_pnm('pnm_files/mandelbrot_binary_swap', 'binary')
   call copy_image%finalize()

   ! Remove the blue channel
   copy_image = image ! Copy the format_pnm object
   call copy_image%remove_channels(remove_b=.true.)
   call copy_image%export_pnm('pnm_files/mandelbrot_binary_remove', 'binary')
   call copy_image%finalize()

   ! Convert the image to greyscale
   copy_image = image ! Copy the format_pnm object
   call copy_image%greyscale()
   call copy_image%export_pnm('pnm_files/mandelbrot_binary_greyscale', 'binary')
   call copy_image%finalize()

   ! Rotate the image 90 degrees clockwise
   copy_image = image ! Copy the format_pnm object
   call copy_image%rotate(-90)
   call copy_image%export_pnm('pnm_files/mandelbrot_binary_rotate', 'binary')
   call copy_image%finalize()

   ! Flip the image horizontally
   copy_image = image ! Copy the format_pnm object
   call copy_image%flip_horizontal()
   call copy_image%export_pnm('pnm_files/mandelbrot_binary_flip_horizontal', 'binary')
   call copy_image%finalize()

   ! Flip the image vertically
   copy_image = image ! Copy the format_pnm object
   call copy_image%flip_vertical()
   call copy_image%export_pnm('pnm_files/mandelbrot_binary_flip_vertical', 'binary')
   call copy_image%finalize()

   ! Crop the image
   copy_image = image ! Copy the format_pnm object
   call copy_image%crop(100,200, 50, 300)
   call copy_image%export_pnm('pnm_files/mandelbrot_binary_crop', 'binary')
   call copy_image%finalize()

   ! Resize the image
   copy_image = image ! Copy the format_pnm object
   call copy_image%resize(800,200)
   call copy_image%export_pnm('pnm_files/mandelbrot_binary_resize', 'binary')
   call copy_image%finalize()

   ! Finalize the format_pnm object to release resources
   call image%finalize()

   ! Import a PPM file with binary encoding and export it with ascii encoding
   call image%import_pnm('pnm_files/mandelbrot_binary', 'ppm', 'binary')
   call image%export_pnm('pnm_files/mandelbrot_ascii_ex', 'ascii')
   call image%finalize()

   ! Import a PPM file with ascii encoding and export it with binary encoding
   call image%import_pnm('pnm_files/mandelbrot_ascii', 'ppm', 'ascii')
   call image%export_pnm('pnm_files/mandelbrot_binary_ex', 'binary')
   call image%finalize()

contains

   ! Function to generate Mandelbrot fractal
   pure function mandelbrot(h, w) result(pixels)
      integer, intent(in)    :: w, h
      integer(ik)            :: pixels(h, 3*w)
      integer(ik), parameter :: max_iter = 256_ik
      real(rk),    parameter :: x_min = -2.0_rk
      real(rk),    parameter :: x_max = 1.0_rk
      real(rk),    parameter :: y_min = -1.5_rk
      real(rk),    parameter :: y_max = 1.5_rk
      real(rk)               :: x, y, x_temp, zx, zy, scale_x, scale_y
      integer(ik)            :: iter
      integer                :: i, j
      ! Calculate scale factors for mapping pixel coordinates to Mandelbrot coordinates
      scale_x = (x_max - x_min) / real(w, kind=rk)
      scale_y = (y_max - y_min) / real(h, kind=rk)
      ! Generate Mandelbrot fractal
      do i = 1, h
         do j = 1, w
            x = x_min + real(j - 1, kind=rk) * scale_x
            y = y_max - real(i - 1, kind=rk) * scale_y
            zx = 0.0_rk
            zy = 0.0_rk
            iter = 0_ik
            do while (iter < max_iter .and. zx * zx + zy * zy < 4.0_rk)
               x_temp = zx * zx - zy * zy + x
               zy = 2.0_rk * zx * zy + y
               zx = x_temp
               iter = iter + 1_ik
            end do
            ! Assign colors
            pixels(i, 3*j-2) = int(mod(iter*7_ik, 256_ik), kind=ik)     ! Red channel
            pixels(i, 3*j-1) = int(mod(iter*4_ik, 256_ik), kind=ik)     ! Green channel
            pixels(i, 3*j)   = int(mod(iter*10_ik, 256_ik), kind=ik)    ! Blue channel
         end do
      end do
   end function

end program demo_ppm
