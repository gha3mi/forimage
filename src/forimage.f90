module forimage

   implicit none

   private
   public format_pnm

   !===============================================================================
   type format_pnm
      character(2)                         :: magic_number
      integer                              :: width
      integer                              :: height
      character(70)                        :: comment
      integer                              :: max_color
      integer, dimension(:,:), allocatable :: pixels
      character(3)                         :: file_format
      character(5)                         :: encoding
   contains
      procedure :: set_format
      procedure :: set_file_format
      procedure :: set_magicnumber
      procedure :: set_width
      procedure :: set_height
      procedure :: set_comment
      procedure :: set_max_color
      procedure :: set_header
      procedure :: allocate_pixels
      procedure :: set_pixels
      procedure :: export_pnm
      procedure :: set_pnm
      procedure :: import_pnm
      procedure :: dlloc => deallocate_pnm
   end type format_pnm
   !===============================================================================

contains

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

      this%encoding = encoding
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
      class(format_pnm), intent(inout)   :: this
      character(*), intent(in)           :: file_name
      character(*), intent(in)           :: encoding
      character(3), intent(in)           :: file_format
      integer :: nunit, i
      character :: temp
      character, allocatable :: temp_pixel(:)

      this%file_format = file_format
      this%encoding = encoding

      select case (encoding)
       case ('binary','raw')

         select case (file_format)
          case ('pbm')
            open (newunit = nunit, file = file_name//'.'//file_format)
            read(nunit,*) this%magic_number
            read(nunit,*) temp,this%comment
            read(nunit,*) this%width, this%height
            allocate(temp_pixel(this%height*this%width))
            read(nunit, '(*(a))', advance='yes') temp_pixel
            close(nunit)
            call this%allocate_pixels()
            this%pixels = transpose(reshape(ichar(temp_pixel), [this%height, this%width]))
          case ('pgm')
            open (newunit = nunit, file = file_name//'.'//file_format)
            read(nunit,*) this%magic_number
            read(nunit,*) temp,this%comment
            read(nunit,*) this%width, this%height
            read(nunit,*) this%max_color
            allocate(temp_pixel(this%height*this%width))
            read(nunit, '(*(a))', advance='yes') temp_pixel
            close(nunit)
            call this%allocate_pixels()
            this%pixels = transpose(reshape(ichar(temp_pixel), [this%height, this%width]))
          case ('ppm')
            open (newunit = nunit, file = file_name//'.'//file_format)
            read(nunit,*) this%magic_number
            read(nunit,*) temp,this%comment
            read(nunit,*) this%width, this%height
            read(nunit,*) this%max_color
            allocate(temp_pixel(this%height*this%width*3))
            read(nunit, '(*(a))', advance='yes') temp_pixel
            close(nunit)
            call this%allocate_pixels()
            this%pixels = transpose(reshape(ichar(temp_pixel), [this%height, 3*this%width]))
         end select

       case ('ascii','plain')

         select case (file_format)
          case ('pbm')
            open (newunit = nunit, file = file_name//'.'//file_format)
            read(nunit,*) this%magic_number
            read(nunit,*) temp,this%comment
            read(nunit,*) this%width, this%height
            call this%allocate_pixels()
            do i = 1, size(this%pixels,1)
               read(nunit, *) this%pixels(i,:)
            end do
            close(nunit)
          case ('pgm')
            open (newunit = nunit, file = file_name//'.'//file_format)
            read(nunit,*) this%magic_number
            read(nunit,*) temp,this%comment
            read(nunit,*) this%width, this%height
            read(nunit,*) this%max_color
            call this%allocate_pixels()
            do i = 1, size(this%pixels,1)
               read(nunit, *) this%pixels(i,:)
            end do
            close(nunit)
          case ('ppm')
            open (newunit = nunit, file = file_name//'.'//file_format)
            read(nunit,*) this%magic_number
            read(nunit,*) temp,this%comment
            read(nunit,*) this%width, this%height
            read(nunit,*) this%max_color
            call this%allocate_pixels()
            do i = 1, size(this%pixels,1)
               read(nunit, *) this%pixels(i,:)
            end do
            close(nunit)
         end select

      end select

   end subroutine import_pnm
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure subroutine set_pnm(this, encoding, file_format,width,height,max_color,comment,pixels)
      class(format_pnm), intent(inout)    :: this
      integer, intent(in)                 :: width
      integer, intent(in)                 :: height
      character(*), intent(in)            :: comment
      integer, optional, intent(in)       :: max_color
      integer, dimension(:,:), intent(in) :: pixels
      character(*), intent(in)            :: encoding
      character(3), intent(in)            :: file_format
      character(2)                        :: magic_number

      select case (encoding)
       case ('ascii','plain')
         select case (file_format)
          case ('pbm')
            magic_number = 'P1'
          case ('pgm')
            magic_number = 'P2'
          case ('ppm')
            magic_number = 'P3'
         end select
       case ('binary','raw')
         select case (file_format)
          case ('pbm')
            magic_number = 'P4'
          case ('pgm')
            magic_number = 'P5'
          case ('ppm')
            magic_number = 'P6'
         end select
      end select

      call this%set_format(encoding)
      call this%set_file_format(file_format)
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
   pure subroutine set_pixels(this, pixels)
      class(format_pnm), intent(inout) :: this
      integer, dimension(:,:), intent(in) :: pixels
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
      class(format_pnm), intent(inout)        :: this
      character(*),      intent(in)           :: file_name
      character(*),      intent(in), optional :: encoding
      integer                                 :: nunit, i, j

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
         open (newunit = nunit, file = file_name//'.'//this%file_format, status='replace')
         write(nunit,'(a)') this%magic_number
         write(nunit,'(a,a)') '# ',this%comment
         write(nunit, '(g0,1x,g0)') this%width, this%height
         if (this%file_format /= 'pbm') write(nunit,'(g0)') this%max_color
         do i = 1, size(this%pixels,1)
            write(nunit, '(*(g0,1x))') this%pixels(i,:)
         end do
         close(nunit)
       case  ('P4', 'P5', 'P6')
         open (newunit = nunit, file = file_name//'.'//this%file_format, status='replace')
         write(nunit,'(a)') this%magic_number
         write(nunit,'(a,a)') '# ',this%comment
         write(nunit, '(g0,1x,g0)') this%width, this%height
         if (this%file_format /= 'pbm') write(nunit,'(g0)') this%max_color
         do i = 1, size(this%pixels,1)
            write(nunit, '(*(a))', advance='no') achar(this%pixels(i,:))
         end do
         close(nunit)
      end select
   end subroutine export_pnm
   !===============================================================================

end module forimage
