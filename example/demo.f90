program demo

   use forimage, only: format_pnm, rk
   implicit none

   ! Declare format_pnm object and parameters for image dimensions
   type(format_pnm)    :: image, edit
   integer, parameter  :: height = 400
   integer, parameter  :: width  = 400
   integer :: px(height, 3*width)

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
   edit = image ! Copy the format_pnm object
   call edit%negative()
   call edit%export_pnm('pnm_files/mandelbrot_binary_negative')
   call edit%finalize()

   ! Brighten the image
   edit = image ! Copy the format_pnm object
   call edit%brighten(100)
   call edit%export_pnm('pnm_files/mandelbrot_binary_brighten')
   call edit%finalize()

   ! Swap the red and blue channels
   edit = image ! Copy the format_pnm object
   call edit%swap_channels('rb')
   call edit%export_pnm('pnm_files/mandelbrot_binary_swap')
   call edit%finalize()

   ! Remove the blue channel
   edit = image ! Copy the format_pnm object
   call edit%remove_channels(remove_b=.true.)
   call edit%export_pnm('pnm_files/mandelbrot_binary_remove')
   call edit%finalize()

   ! Convert the image to greyscale
   edit = image ! Copy the format_pnm object
   call edit%greyscale()
   call edit%export_pnm('pnm_files/mandelbrot_binary_greyscale')
   call edit%finalize()

   ! Rotate the image 90 degrees clockwise
   edit = image ! Copy the format_pnm object
   call edit%rotate(-90)
   call edit%export_pnm('pnm_files/mandelbrot_binary_rotate')
   call edit%finalize()

   ! Flip the image horizontally
   edit = image ! Copy the format_pnm object
   call edit%flip_horizontal()
   call edit%export_pnm('pnm_files/mandelbrot_binary_flip_horizontal')
   call edit%finalize()

   ! Flip the image vertically
   edit = image ! Copy the format_pnm object
   call edit%flip_vertical()
   call edit%export_pnm('pnm_files/mandelbrot_binary_flip_vertical')
   call edit%finalize()

   ! Crop the image
   edit = image ! Copy the format_pnm object
   call edit%crop(100,200, 50, 300)
   call edit%export_pnm('pnm_files/mandelbrot_binary_crop')
   call edit%finalize()

   ! Resize the image
   edit = image ! Copy the format_pnm object
   call edit%resize(800,200)
   call edit%export_pnm('pnm_files/mandelbrot_binary_resize')
   call edit%finalize()

   ! Import a PPM file with binary encoding and export it with ascii encoding
   edit = image ! Copy the format_pnm object
   call edit%import_pnm('pnm_files/mandelbrot_binary', 'ppm', 'binary')
   call edit%export_pnm('pnm_files/mandelbrot_ascii_ex', 'ascii')
   call edit%finalize()

   ! Import a PPM file with ascii encoding and export it with binary encoding
   edit = image ! Copy the format_pnm object
   call edit%import_pnm('pnm_files/mandelbrot_ascii', 'ppm', 'ascii')
   call edit%export_pnm('pnm_files/mandelbrot_binary_ex', 'binary')
   call edit%finalize()


   ! Finalize the format_pnm object to release resources
   call image%finalize()

contains

   ! Function to generate Mandelbrot fractal
   function mandelbrot(h, w) result(pixels)
      integer, intent(in) :: w, h
      integer             :: pixels(h, 3*w)
      integer, parameter  :: max_iter = 256
      real(rk), parameter :: x_min = -2.0_rk
      real(rk), parameter :: x_max = 1.0_rk
      real(rk), parameter :: y_min = -1.5_rk
      real(rk), parameter :: y_max = 1.5_rk
      real(rk) :: x, y, x_temp, zx, zy, zx2, zy2, scale_x, scale_y
      integer  :: iter, i, j
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
            iter = 0
            do while (iter < max_iter .and. zx * zx + zy * zy < 4.0_rk)
               x_temp = zx * zx - zy * zy + x
               zy = 2.0_rk * zx * zy + y
               zx = x_temp
               iter = iter + 1
            end do
            ! Assign colors
            pixels(i, 3*j-2) = mod(iter*7, 256)     ! Red channel
            pixels(i, 3*j-1) = mod(iter*4, 256)     ! Green channel
            pixels(i, 3*j)   = mod(iter*10, 256)    ! Blue channel
         end do
      end do
   end function

end program demo
