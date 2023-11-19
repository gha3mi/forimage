module pnm

   use forimage_parameters, only: rk, ik
   implicit none

   private
   public format_pnm

   !===============================================================================
   type format_pnm
      character(2)                             , private :: magic_number
      integer                                  , private :: width
      integer                                  , private :: height
      character(:), allocatable                , private :: comment
      integer                                  , private :: max_color
      integer(ik), dimension(:,:), allocatable :: pixels
      character(3)                             , private :: file_format
      character(6)                             , private :: encoding
   contains
      procedure :: set_format
      procedure, private :: set_file_format
      procedure, private :: set_magicnumber
      procedure, private :: set_width
      procedure, private :: set_height
      procedure, private :: set_comment
      procedure, private :: set_max_color
      procedure, private :: set_header
      procedure, private :: allocate_pixels
      procedure, private :: check_pixel_range
      procedure, private :: set_pixels
      procedure :: set_pnm
      procedure :: print_info
      procedure :: import_pnm
      procedure :: export_pnm
      procedure :: finalize => deallocate_pnm
      procedure :: negative
      procedure :: brighten
      procedure :: swap_channels
      procedure :: remove_channels
      procedure :: greyscale
      procedure :: rotate
      procedure :: flip_horizontal
      procedure :: flip_vertical
      procedure :: crop
      procedure :: resize
   end type format_pnm
   !===============================================================================

contains

   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine print_info(this)
      class(format_pnm), intent(in) :: this
      real(rk) :: avg, avg_red, avg_green, avg_blue
      real(rk) :: asp_ratio
      real(rk) :: pixel_size_kb, pixel_size_mb

      select case (this%file_format)
       case ('pbm', 'pgm')
         call average_colors(this, avg)
       case ('ppm')
         call average_colors(this, avg, avg_red, avg_green, avg_blue)
      end select
      call aspect_ratio(this, asp_ratio)
      call pixel_size(this, pixel_size_kb, pixel_size_mb)

      print '(a)'                           , 'Image Information:'
      print '(a)'                           , '-------------------------------------------'
      print '(a, g0)'                       , 'Magic Number: ', this%magic_number
      print '(a, a)'                        , 'File Format : ', this%file_format
      print '(a, a)'                        , 'Encoding    : ', this%encoding
      print '(a, a)'                        , 'Comment     : ', trim(this%comment)
      print '(a, a, g0, a, g0)'             , 'Dimensions  : ', 'Height: ', this%height, ' Width: ', this%width
      print '(a, g0)'                       , 'Total Pixels: ', this%width * this%height
      print '(a, f6.2)'                     , 'Aspect Ratio: ', asp_ratio
      print '(a, f8.2, a, f8.2, a)'         , 'Pixel Size  : ', pixel_size_kb, ' KB ', pixel_size_mb, ' MB'
      select case (this%file_format)
       case ('pbm', 'pgm')
         print '(a, g0)'                     , 'Average     : ', avg
       case ('ppm')
         print '(a, g0)'                       , 'Max Color   : ', this%max_color
         print '(a, a, f6.2, a, f6.2, a, f6.2)', 'Average RGB : ', 'R:', avg_red, ' G:', avg_green, ' B:', avg_blue
      end select
      print '(a)'                           , '-------------------------------------------'
   end subroutine print_info
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine pixel_size(this, pixel_size_kb, pixel_size_mb)
      class(format_pnm), intent(in) :: this
      real(rk), intent(out) :: pixel_size_kb, pixel_size_mb
      integer :: bits_per_channel, bytes_per_pixel

      bits_per_channel = 8

      select case (this%file_format)
       case ('pbm', 'pgm')
         bytes_per_pixel = bits_per_channel
       case ('ppm')
         bytes_per_pixel = bits_per_channel*3
      end select

      pixel_size_kb = real(this%width*this%height * bytes_per_pixel, kind=rk) / 1024.0_rk
      pixel_size_mb = pixel_size_kb / 1024.0_rk
   end subroutine pixel_size
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine average_colors(this, avg, avg_red, avg_green, avg_blue)
      class(format_pnm), intent(in) :: this
      real(rk), intent(out), optional :: avg_red, avg_green, avg_blue, avg

      select case (this%file_format)
       case ('pbm', 'pgm')

         avg = sum(this%pixels) / real(this%width*this%height, kind=rk)

       case ('ppm')

         avg_red   = sum(this%pixels(:, 1:this%width:3)) / real(this%width*this%height, kind=rk)
         avg_green = sum(this%pixels(:, 2:this%width:3)) / real(this%width*this%height, kind=rk)
         avg_blue  = sum(this%pixels(:, 3:this%width:3)) / real(this%width*this%height, kind=rk)

      end select

   end subroutine average_colors
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine aspect_ratio(this, ratio)
      class(format_pnm), intent(in) :: this
      real(rk), intent(out) :: ratio
      ratio = real(this%width, kind=rk) / real(this%height, kind=rk)
   end subroutine aspect_ratio
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine resize(this, new_height, new_width)
      class(format_pnm), intent(inout)         :: this
      integer,           intent(in)            :: new_width, new_height
      integer(ik), dimension(:,:), allocatable :: resized_pixels
      integer                                  :: i_out, j_out, i_in, j_in, channel
      real(rk)                                 :: width_scale, height_scale

      select case (this%file_format)
       case ('pbm', 'pgm')

         allocate(resized_pixels(new_height, new_width))

         width_scale  = real(this%width, kind=rk) / real(new_width, kind=rk)
         height_scale = real(this%height, kind=rk) / real(new_height, kind=rk)

         do i_out = 1, new_height
            do j_out = 1, new_width
               i_in = min(this%height, max(1, int((real(i_out, kind=rk) - 0.5_rk) * height_scale) + 1))
               j_in = min(this%width,  max(1, int((real(j_out, kind=rk) - 0.5_rk) * width_scale)  + 1))

               resized_pixels(i_out, j_out) = this%pixels(i_in, j_in)
            end do
         end do

       case ('ppm')

         allocate(resized_pixels(new_height, 3*new_width))

         width_scale  = real(this%width, kind=rk) / real(new_width, kind=rk)
         height_scale = real(this%height, kind=rk) / real(new_height, kind=rk)

         do i_out = 1, new_height
            do j_out = 1, new_width
               i_in = min(this%height,  max(1, int((real(i_out, kind=rk) - 0.5_rk) * height_scale) + 1))
               j_in = min(3*this%width, max(1, int((real(j_out, kind=rk) - 0.5_rk) * width_scale)  + 1))

               do channel = 1, 3
                  resized_pixels(i_out, 3*(j_out-1) + channel) = this%pixels(i_in, 3*(j_in-1)+channel)
               end do
            end do
         end do

      end select

      call this%set_height(new_height)
      call this%set_width(new_width)
      deallocate(this%pixels)
      call this%allocate_pixels()
      call this%set_pixels(resized_pixels)

      deallocate(resized_pixels)
   end subroutine resize
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine crop(this, start_row, end_row, start_col, end_col)
      class(format_pnm), intent(inout)         :: this
      integer,           intent(in)            :: start_row, end_row, start_col, end_col
      integer                                  :: cropped_start_row, cropped_end_row, cropped_start_col, cropped_end_col
      integer(ik), dimension(:,:), allocatable :: cropped_pixels
      integer                                  :: i, j, cropped_height, cropped_width

      ! Check if the cropping coordinates are within the image boundaries
      cropped_start_row = max(1, start_row)
      cropped_end_row   = min(this%height, end_row)
      cropped_start_col = max(1, start_col)
      cropped_end_col   = min(this%width, end_col)

      ! Calculate the dimensions of the cropped image
      cropped_height = cropped_end_row - cropped_start_row + 1
      cropped_width  = cropped_end_col - cropped_start_col + 1

      select case (this%file_format)
       case ('pbm', 'pgm')

         ! Allocate memory for cropped image pixels
         allocate(cropped_pixels(cropped_height, cropped_width))

         ! Copy the cropped pixels to the new array
         do i = 1, cropped_height
            do j = 1, cropped_width
               cropped_pixels(i, j) = this%pixels(cropped_start_row-1+i, (cropped_start_col-1)+j)
            end do
         end do

       case ('ppm')

         ! Allocate memory for cropped image pixels
         allocate(cropped_pixels(cropped_height, 3*cropped_width))

         ! Copy the cropped pixels to the new array
         do i = 1, cropped_height
            do j = 1, 3*cropped_width
               cropped_pixels(i, j) = this%pixels(cropped_start_row-1+i, (cropped_start_col-1)*3+j)
            end do
         end do

      end select

      ! Update image dimensions and pixels
      call this%set_height(cropped_height)
      call this%set_width(cropped_width)
      deallocate(this%pixels)
      call this%allocate_pixels()

      call this%set_pixels(cropped_pixels)

      ! Deallocate temporary array
      deallocate(cropped_pixels)
   end subroutine crop
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine flip_vertical(this)
      class(format_pnm), intent(inout) :: this

      this%pixels = this%pixels(size(this%pixels,1):1:-1, :)
      call this%check_pixel_range(this%pixels)

      call this%set_height(size(this%pixels,1))

      select case (this%file_format)
       case ('pbm', 'pgm')
         call this%set_width(size(this%pixels,2))
       case ('ppm')
         call this%set_width(size(this%pixels,2)/3)
      end select
   end subroutine flip_vertical
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine flip_horizontal(this)
      class(format_pnm), intent(inout) :: this

      select case (this%file_format)
       case ('pbm', 'pgm')

         this%pixels = this%pixels(:, this%width:1:-1)

         call this%check_pixel_range(this%pixels)

       case ('ppm')

         this%pixels(:, 1:size(this%pixels, 2):3) = this%pixels(:, size(this%pixels, 2)-2:1:-3)
         this%pixels(:, 2:size(this%pixels, 2):3) = this%pixels(:, size(this%pixels, 2)-1:2:-3)
         this%pixels(:, 3:size(this%pixels, 2):3) = this%pixels(:, size(this%pixels, 2)-0:3:-3)

         call this%check_pixel_range(this%pixels)

      end select

      call this%set_height(size(this%pixels,1))

      select case (this%file_format)
       case ('pbm', 'pgm')
         call this%set_width(size(this%pixels,2))
       case ('ppm')
         call this%set_width(size(this%pixels,2)/3)
      end select

   end subroutine flip_horizontal
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine rotate(this, angle)
      class(format_pnm), intent(inout)         :: this
      integer,           intent(in)            :: angle
      integer(ik), dimension(:,:), allocatable :: rotated_pixels
      integer                                  :: target_height, target_width
      integer                                  :: i, j

      ! Determine the target height and width based on the rotation angle
      select case (angle)
       case (90, -90, 270, -270)
         target_height = this%width
         target_width  = this%height
       case (180, -180)
         target_height = this%height
         target_width  = this%width
       case default
         error stop "Invalid rotation angle. Valid angles are 90, 180, 270, -90, -180, -270."
      end select

      select case (this%file_format)
       case ('pbm', 'pgm')

         ! Allocate memory for rotated_pixels array
         allocate(rotated_pixels(target_height, target_width))

         ! Rotate pixels based on the specified angle
         select case (angle)
          case (90, -270)
            do i = 1, this%height
               do j = 1, this%width
                  rotated_pixels(j, this%height-i+1) = this%pixels(i, j)
               end do
            end do
          case (180, -180)
            do i = 1, this%height
               do j = 1, this%width
                  rotated_pixels(this%height-i+1, this%width-j+1) = this%pixels(i, j)
               end do
            end do
          case (270, -90)
            do i = 1, this%height
               do j = 1, this%width
                  rotated_pixels(this%width-j+1, i) = this%pixels(i, j)
               end do
            end do
         end select

       case ('ppm')

         ! Allocate memory for rotated_pixels array
         allocate(rotated_pixels(target_height, 3*target_width))

         ! Rotate pixels based on the specified angle
         select case (angle)
          case (90, -270)
            do i = 1, this%height
               do j = 1, this%width
                  rotated_pixels(j, 3*(this%height-i+1)-2:3*(this%height-i+1)) = this%pixels(i, 3*j-2:3*j)
               end do
            end do
          case (180, -180)
            do i = 1, this%height
               do j = 1, this%width
                  rotated_pixels(this%height-i+1, 3*(this%width-j+1)-2:3*(this%width-j+1)) = this%pixels(i, 3*j-2:3*j)
               end do
            end do
          case (270, -90)
            do i = 1, this%height
               do j = 1, this%width
                  rotated_pixels(this%width-j+1, 3*i-2:3*i) = this%pixels(i, 3*j-2:3*j)
               end do
            end do
         end select

      end select

      ! Update height and width of the image
      call this%set_height(target_height)
      call this%set_width(target_width)

      deallocate(this%pixels)
      call this%allocate_pixels()

      ! Update the original pixels with rotated pixels
      call this%set_pixels(rotated_pixels)

      ! Deallocate rotated_pixels array
      deallocate(rotated_pixels)
   end subroutine rotate
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine greyscale(this)
      class(format_pnm), intent(inout) :: this
      integer                          :: i, j

      ! Check if the file is ppm
      if (this%file_format /= 'ppm') error stop 'greyscale: This function is only for ppm files.'

      do i = 1, this%height
         do j = 1, this%width
            ! Calculate the ITU Rec.709 weighted average of RGB channels to derive a greyscale value and assign it as an integer to all RGB channels.
            this%pixels(i, 3*j-2:3*j) = int(0.2126_rk * real(this%pixels(i, 3*j-2), kind=rk) + &
                                            0.7152_rk * real(this%pixels(i, 3*j-1), kind=rk) + &
                                            0.0722_rk * real(this%pixels(i, 3*j-0), kind=rk), kind=ik)
         end do
      end do

      call this%check_pixel_range(this%pixels)

   end subroutine greyscale
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine remove_channels(this, remove_r, remove_g, remove_b)
      class(format_pnm), intent(inout) :: this
      logical, optional, intent(in)    :: remove_r, remove_g, remove_b

      ! Check if the file is ppm
      if (this%file_format /= 'ppm') error stop 'remove_channels: This function is only for ppm files.'

      ! Remove R channel
      if (present(remove_r)) then
         if (remove_r) then
            this%pixels(:,1:size(this%pixels,2):3) = 0_ik
         end if
      end if

      ! Remove G channel
      if (present(remove_g)) then
         if (remove_g) then
            this%pixels(:,2:size(this%pixels,2):3) = 0_ik
         end if
      end if

      ! Remove B channel
      if (present(remove_b)) then
         if (remove_b) then
            this%pixels(:,3:size(this%pixels,2):3) = 0_ik
         end if
      end if

      call this%check_pixel_range(this%pixels)

   end subroutine remove_channels
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine swap_channels(this, swap)
      class(format_pnm), intent(inout) :: this
      character(*),      intent(in)    :: swap
      integer(ik)                      :: temp
      integer                          :: i, j

      ! Check if the file is ppm
      if (this%file_format /= 'ppm') error stop 'swap_channels: This function is only for ppm files.'

      ! Swap R and G channels
      if (swap=='rg' .or. swap=='gr' .or. swap=='RG' .or. swap=='GR') then
         do i = 1, this%height
            do j = 1, this%width
               temp = this%pixels(i, 3*j-2)
               this%pixels(i, 3*j-2) = this%pixels(i, 3*j-1)
               this%pixels(i, 3*j-1) = temp
            end do
         end do
      end if

      ! Swap G and B channels
      if (swap=='gb' .or. swap=='bg' .or. swap=='GB' .or. swap=='BG') then
         do i = 1, this%height
            do j = 1, this%width
               temp = this%pixels(i, 3*j-1)
               this%pixels(i, 3*j-1) = this%pixels(i, 3*j-0)
               this%pixels(i, 3*j-0) = temp
            end do
         end do
      end if

      ! Swap R and B channels
      if (swap=='rb' .or. swap=='br' .or. swap=='RB' .or. swap=='BR') then
         do i = 1, this%height
            do j = 1, this%width
               temp = this%pixels(i, 3*j-2)
               this%pixels(i, 3*j-2) = this%pixels(i, 3*j-0)
               this%pixels(i, 3*j-0) = temp
            end do
         end do
      end if

      call this%check_pixel_range(this%pixels)
   end subroutine swap_channels
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine brighten(this, factor)
      class(format_pnm), intent(inout) :: this
      integer,           intent(in)    :: factor

      select case (this%file_format)
       case ('pbm')
         error stop 'brighten: This function is not supported for pbm files.'
       case ('pgm', 'ppm')
         call this%set_pixels(min(this%max_color, max(0, this%pixels + factor)))
      end select
   end subroutine brighten
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine negative(this)
      class(format_pnm), intent(inout) :: this

      call this%set_pixels(this%max_color - this%pixels)
   end subroutine negative
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_file_format(this, file_format)
      class(format_pnm), intent(inout) :: this
      character(3), intent(in)         :: file_format

      this%file_format = file_format
   end subroutine set_file_format
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_format(this, encoding)
      class(format_pnm), intent(inout) :: this
      character(*), intent(in)         :: encoding

      this%encoding = trim(encoding)
   end subroutine set_format
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine deallocate_pnm(this)
      class(format_pnm), intent(inout)    :: this
      if (allocated(this%pixels)) deallocate(this%pixels)
   end subroutine deallocate_pnm
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   impure subroutine import_pnm(this, file_name, file_format, encoding)
      class(format_pnm), intent(inout)       :: this
      character(*),      intent(in)          :: file_name, encoding
      character(3),      intent(in)          :: file_format
      integer                                :: nunit, iostat
      character, dimension(:), allocatable   :: buffer_ch
      integer(ik), dimension(:), allocatable :: buffer_int
      logical                                :: file_exists

      inquire(file=file_name//'.'//file_format, exist=file_exists)
      if (file_exists) then

         call this%set_file_format(file_format)
         call this%set_format(encoding)

         select case (this%encoding)
          case ('binary','raw')

            select case (file_format)
             case ('pbm')
               open (newunit = nunit, file = file_name//'.'//file_format, iostat=iostat)
               if (iostat /= 0) error stop 'Error opening the file.'
               call read_header(this, nunit)
               allocate(buffer_ch(this%height*this%width))
               buffer_ch = achar(0_ik)
               read(nunit,'(*(a))', advance='no', iostat=iostat) buffer_ch
               if (iostat /= 0) error stop 'Error reading the file.'
               call this%allocate_pixels()
               this%pixels = iachar(transpose(reshape(buffer_ch, [this%width, this%height])), kind=ik)
               close(nunit)
             case ('pgm')
               open (newunit = nunit, file = file_name//'.'//file_format, iostat=iostat)
               if (iostat /= 0) error stop 'Error opening the file.'
               call read_header(this, nunit)
               allocate(buffer_ch(this%height*this%width))
               buffer_ch = achar(0_ik)
               read(nunit,'(*(a))', advance='no', iostat=iostat) buffer_ch
               if (iostat /= 0) error stop 'Error reading the file.'
               call this%allocate_pixels()
               this%pixels = iachar(transpose(reshape(buffer_ch, [this%width, this%height])), kind=ik)
               close(nunit)
             case ('ppm')
               open (newunit = nunit, file = file_name//'.'//file_format, iostat=iostat)
               if (iostat /= 0) error stop 'Error opening the file.'
               call read_header(this, nunit)
               allocate(buffer_ch(this%height*3*this%width))
               buffer_ch = achar(0_ik)
               read(nunit,'(*(a))', advance='no', iostat=iostat) buffer_ch
               call this%allocate_pixels()
               this%pixels = iachar(transpose(reshape(buffer_ch, [this%width*3, this%height])), kind=ik)
               close(nunit)
            end select

          case ('ascii','plain')

            select case (file_format)
             case ('pbm')
               open (newunit = nunit, file = file_name//'.'//file_format, iostat=iostat)
               if (iostat /= 0) error stop 'Error opening the file.'
               call read_header(this, nunit)
               allocate(buffer_int(this%height*this%width))
               buffer_int = 0_ik
               read(nunit, *) buffer_int
               call this%allocate_pixels()
               this%pixels = transpose(reshape(buffer_int, [this%width, this%height]))
               close(nunit)
               call this%check_pixel_range(this%pixels)
             case ('pgm')
               open (newunit = nunit, file = file_name//'.'//file_format, iostat=iostat)
               if (iostat /= 0) error stop 'Error opening the file.'
               call read_header(this, nunit)
               allocate(buffer_int(this%height*this%width))
               buffer_int = 0_ik
               read(nunit, *) buffer_int
               call this%allocate_pixels()
               this%pixels = transpose(reshape(buffer_int, [this%width, this%height]))
               call this%check_pixel_range(this%pixels)
               close(nunit)
             case ('ppm')
               open (newunit = nunit, file = file_name//'.'//file_format, iostat=iostat)
               if (iostat /= 0) error stop 'Error opening the file.'
               call read_header(this, nunit)
               allocate(buffer_int(this%height*3*this%width))
               buffer_int = 0_ik
               read(nunit, *) buffer_int
               call this%allocate_pixels()
               this%pixels = transpose(reshape(buffer_int, [this%width*3, this%height]))
               call this%check_pixel_range(this%pixels)
               close(nunit)
            end select

         end select

      else
         error stop 'Error: File does not exist.'
      end if
   end subroutine import_pnm
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure subroutine set_pnm(this, encoding, file_format,width,height,max_color,comment,pixels)
      class(format_pnm),           intent(inout) :: this
      integer,                     intent(in)    :: width
      integer,                     intent(in)    :: height
      character(*),                intent(in)    :: comment
      integer, optional,           intent(in)    :: max_color
      integer(ik), dimension(:,:), intent(in)    :: pixels
      character(*),                intent(in)    :: encoding
      character(3),                intent(in)    :: file_format
      character(2)                               :: magic_number

      call this%set_format(encoding)
      call this%set_file_format(file_format)

      select case (this%encoding)
       case ('ascii','plain')
         select case (this%file_format)
          case ('pbm')
            magic_number = 'P1'
          case ('pgm')
            magic_number = 'P2'
          case ('ppm')
            magic_number = 'P3'
         end select
       case ('binary','raw')
         select case (this%file_format)
          case ('pbm')
            magic_number = 'P4'
          case ('pgm')
            magic_number = 'P5'
          case ('ppm')
            magic_number = 'P6'
         end select
      end select

      call this%set_header(magic_number,width,height,comment,max_color)
      call this%allocate_pixels()
      call this%set_pixels(pixels)
   end subroutine set_pnm
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine allocate_pixels(this)
      class(format_pnm), intent(inout) :: this
      select case(this%magic_number)
       case('P1')
         if (.not.allocated(this%pixels)) allocate(this%pixels(this%height, this%width))
       case('P2')
         if (.not.allocated(this%pixels)) allocate(this%pixels(this%height, this%width))
       case('P3')
         if (.not.allocated(this%pixels)) allocate(this%pixels(this%height, 3*this%width))
       case('P4')
         if (.not.allocated(this%pixels)) allocate(this%pixels(this%height, this%width))
       case('P5')
         if (.not.allocated(this%pixels)) allocate(this%pixels(this%height, this%width))
       case('P6')
         if (.not.allocated(this%pixels)) allocate(this%pixels(this%height, 3*this%width))
      end select
   end subroutine allocate_pixels
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_magicnumber(this, magic_number)
      class(format_pnm), intent(inout) :: this
      character(*), intent(in)         :: magic_number
      this%magic_number = magic_number
   end subroutine set_magicnumber
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_width(this, width)
      class(format_pnm), intent(inout) :: this
      integer, intent(in)              :: width
      this%width = width
   end subroutine set_width
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_height(this, height)
      class(format_pnm), intent(inout) :: this
      integer, intent(in)              :: height
      this%height = height
   end subroutine set_height
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_comment(this, comment)
      class(format_pnm), intent(inout) :: this
      character(*), intent(in)         :: comment
      this%comment = comment
   end subroutine set_comment
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_max_color(this, max_color)
      class(format_pnm), intent(inout) :: this
      integer, intent(in)              :: max_color
      this%max_color = max_color
   end subroutine set_max_color
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_header(this, magic_number, width, height, comment, max_color)
      class(format_pnm), intent(inout) :: this
      character(*), intent(in)         :: magic_number
      integer, intent(in)              :: width
      integer, intent(in)              :: height
      character(*), intent(in)         :: comment
      integer, optional, intent(in)    :: max_color

      call this%set_magicnumber(magic_number)
      call this%set_width(width)
      call this%set_height(height)
      call this%set_comment(comment)
      if (this%file_format /= 'pbm') call this%set_max_color(max_color)
   end subroutine set_header
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure subroutine check_pixel_range(this, pixels)
      class(format_pnm),           intent(inout) :: this
      integer(ik), dimension(:,:), intent(in)    :: pixels

      ! Check if the pixel values are within the valid range
      select case (this%file_format)
       case ('pbm')
         if (maxval(pixels) > 1 .or. minval(pixels) < 0) error stop 'set_pixels: Invalid pixel values.'
       case ('pgm')
         if (maxval(pixels) > this%max_color .or. minval(pixels) < 0) error stop 'set_pixels: Invalid pixel values.'
       case ('ppm')
         if (maxval(pixels) > this%max_color .or. minval(pixels) < 0) error stop 'set_pixels: Invalid pixel values.'
      end select
   end subroutine check_pixel_range
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure subroutine set_pixels(this, pixels)
      class(format_pnm), intent(inout) :: this
      integer(ik), dimension(:,:), intent(in) :: pixels

      call this%check_pixel_range(pixels)

      this%pixels = pixels
   end subroutine set_pixels
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_pixel(this, grey,r,g,b, i, j)
      class(format_pnm), intent(inout) :: this
      integer, intent(in), optional    :: grey
      integer, intent(in), optional    :: r, g, b
      integer, intent(in)              :: i, j
      select case(this%magic_number)
       case('P1')
         this%pixels(i,j) = grey
       case('P2')
         this%pixels(i,j) = grey
       case('P3')
         this%pixels(i,3*j-2) = r
         this%pixels(i,3*j-1) = g
         this%pixels(i,3*j-0) = b
      end select
   end subroutine set_pixel
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   impure subroutine export_pnm(this, file_name, encoding)
      class(format_pnm), intent(inout)            :: this
      character(*),      intent(in)               :: file_name
      character(*),      intent(in), optional     :: encoding
      integer                                     :: nunit
      integer                                     :: iostat

      if (present(encoding)) then
         call this%set_format(encoding)

         select case (this%encoding)
          case ('ascii','plain')
            select case (this%file_format)
             case ('pbm')
               this%magic_number = 'P1'
             case ('pgm')
               this%magic_number = 'P2'
             case ('ppm')
               this%magic_number = 'P3'
            end select
          case ('binary','raw')
            select case (this%file_format)
             case ('pbm')
               this%magic_number = 'P4'
             case ('pgm')
               this%magic_number = 'P5'
             case ('ppm')
               this%magic_number = 'P6'
            end select
         end select
      end if

      select case (this%magic_number)
       case ('P1', 'P2', 'P3')
         open (newunit = nunit, file = file_name//'.'//this%file_format, status='replace', iostat=iostat)
         if (iostat /= 0) error stop 'Error opening the file.'
         call write_header(this, nunit)
         write(nunit, '(*(g0,1x))', advance='no') transpose(this%pixels)
         close(nunit)
       case ('P4', 'P5', 'P6')
         open (newunit = nunit, file = file_name//'.'//this%file_format, status='replace', iostat=iostat)
         if (iostat /= 0) error stop 'Error opening the file.'
         call write_header(this, nunit)
         write(nunit, '(*(a))', advance='no') transpose(achar(this%pixels))
         close(nunit)
      end select
   end subroutine export_pnm
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   subroutine write_header(this, nunit)
      type(format_pnm), intent(in) :: this
      integer, intent(in)           :: nunit
      integer :: i, k

      ! Write magic number
      write(nunit,'(a)') this%magic_number

      ! Write comments
      k = ceiling(real(len(adjustl(this%comment)))/70.0)
      if (len(adjustl(this%comment)) /=0 .and. len(adjustl(this%comment)) <= 70) then
         write(nunit,'(a,a)') '# ',trim(adjustl(this%comment))
      else if (len(adjustl(this%comment)) /=0 .and. len(adjustl(this%comment)) > 70 ) then
         do i = 1, k-1
            write(nunit,'(a,a)') '# ',adjustl(this%comment(70*(i-1)+1:70*(i-1)+70))
         end do
         write(nunit,'(a,a)') '# ',trim(adjustl(this%comment(70*(k-1)+1:)))
      end if

      ! Write width, height and max_color
      write(nunit, '(g0,1x,g0)') this%width, this%height
      if (this%file_format /= 'pbm') write(nunit,'(g0)') this%max_color
   end subroutine write_header
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   subroutine read_header(this, nunit)
      class(format_pnm), intent(inout) :: this
      integer, intent(in)           :: nunit
      character(len=70) :: comment
      character :: temp
      integer :: i, k

      read(nunit,*)
      k = 0
      do
         read(nunit,'(a)') temp
         if (temp /= '#') exit
         k = k + 1
      end do
      rewind(nunit)
      read(nunit,*) this%magic_number
      this%comment = ''
      do i = 1, k
         read(nunit,'(a,a,a)') temp, temp, comment
         this%comment = this%comment//comment
      end do
      read(nunit,*) this%width, this%height
      if (this%file_format == 'pgm' .or. this%file_format == 'ppm') read(nunit,*) this%max_color
   end subroutine read_header
   !===============================================================================

end module pnm
