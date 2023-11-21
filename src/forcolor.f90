module forcolor

   use forimage_parameters, only: rk, ik
   use pnm, only: format_pnm

   implicit none

   private

   public :: color

   !===============================================================================
   type :: color
      integer(ik)        , private :: r=0_ik, g=0_ik, b=0_ik                   !! rgb
      integer(ik)        , private :: c=0_ik, m=0_ik, y=0_ik, k=0_ik           !! cmyk
      integer(ik)        , private :: decimal=0_ik                             !! decimal
      character(len=7)   , private :: hex='#000000'                            !! hex
      real(rk)           , private :: h=0.0_rk, s=0.0_rk, v=0.0_rk             !! hsv
      real(rk)           , private :: hl=0.0_rk, sl=0.0_rk, vl=0.0_rk          !! hsl
      real(rk)           , private :: xyz_x=0.0_rk, xyz_y=0.0_rk, xyz_z=0.0_rk !! xyz
      character(len=256) , private :: color_name                               !! color name
   contains
      procedure :: set
      procedure, private :: set_by_name
      procedure, private :: set_name
      procedure, private :: set_rgb
      procedure, private :: set_hex
      procedure, private :: set_decimal
      procedure, private :: set_cmyk
      procedure, private :: set_hsv
      procedure, private :: set_hsl
      procedure, private :: set_xyz
      procedure :: get
      procedure, private :: get_name
      procedure, private :: get_rgb
      procedure, private :: get_hex
      procedure, private :: get_decimal
      procedure, private :: get_cmyk
      procedure, private :: get_hsv
      procedure, private :: get_hsl
      procedure, private :: get_xyz
      procedure :: print
      procedure, private :: print_name
      procedure, private :: print_rgb
      procedure, private :: print_hex
      procedure, private :: print_decimal
      procedure, private :: print_cmyk
      procedure, private :: print_hsv
      procedure, private :: print_hsl
      procedure, private :: print_xyz
      procedure, private :: copy_color
      generic :: assignment(=) => copy_color
      procedure :: convert
      procedure :: find_nearest
      procedure :: print_available_colors
      procedure :: save
      procedure :: save_available_colors
   end type color
   !===============================================================================

contains

   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure subroutine initialize_colors(colors)
      type(color), intent(out), dimension(:), allocatable :: colors

      allocate(colors(14))

      call colors(1)%set( name='red',           r=255_ik,    g=0_ik,      b=0_ik)
      call colors(2)%set( name='green',         r=0_ik,      g=128_ik,    b=0_ik)
      call colors(3)%set( name='blue',          r=0_ik,      g=0_ik,      b=255_ik)
      call colors(4)%set( name='yellow',        r=255_ik,    g=255_ik,    b=0_ik)
      call colors(5)%set( name='cyan',          r=0_ik,      g=255_ik,    b=255_ik)
      call colors(6)%set( name='magenta',       r=255_ik,    g=0_ik,      b=255_ik)
      call colors(7)%set( name='black',         r=0_ik,      g=0_ik,      b=0_ik)
      call colors(8)%set( name='white',         r=255_ik,    g=255_ik,    b=255_ik)
      call colors(9)%set( name='gray',          r=128_ik,    g=128_ik,    b=128_ik)
      call colors(10)%set(name='brown',         r=165_ik,    g=42_ik,     b=42_ik)
      call colors(11)%set(name='orange',        r=255_ik,    g=165_ik,    b=0_ik)
      call colors(12)%set(name='gold',          r=255_ik,    g=215_ik,    b=0_ik)
      call colors(13)%set(name='pink',          r=255_ik,    g=192_ik,    b=203_ik)
      call colors(14)%set(name='violet',        r=138_ik,    g=43_ik,     b=226_ik)

      call colors(1:14)%convert('rgb2all')
   end subroutine initialize_colors
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine print(this, option)
      class(color), intent(inout) :: this
      character(len=*), intent(in), optional :: option

      if (present(option)) then

         select case (trim(option))
          case ('rgb')
            call this%print_rgb()
            print*,''
          case ('hex')
            call this%print_hex()
            print*,''
          case ('decimal')
            call this%print_decimal()
            print*,''
          case ('cmyk')
            call this%print_cmyk()
            print*,''
          case ('hsv')
            call this%print_hsv()
            print*,''
          case ('hsl')
            call this%print_hsl()
            print*,''
          case ('name')
            call this%print_name()
            print*,''
          case ('xyz')
            call this%print_xyz()
            print*,''
          case default
            error stop 'error: unknown option'
         end select

      else

         call this%print_name()
         call this%print_rgb()
         call this%print_hex()
         call this%print_decimal()
         call this%print_cmyk()
         call this%print_hsv()
         call this%print_hsl()
         call this%print_xyz()
         print*,''

      end if

   end subroutine print
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine print_name(this)
      class(color), intent(in) :: this
      print '(a,a)', 'color name: ', trim(this%color_name)
   end subroutine print_name
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine print_hsl(this)
      class(color), intent(in) :: this
      print '(a, 3(f8.4, 2x))', "hsl: ", this%hl, this%sl, this%vl
   end subroutine print_hsl
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine print_hsv(this)
      class(color), intent(in) :: this
      print '(a, 3(f8.4, 2x))', "hsv: ", this%h, this%s, this%v
   end subroutine print_hsv
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine print_rgb(this)
      class(color), intent(in) :: this
      print'(a,g0,a,g0,a,g0)', 'rgb: ', this%r, ', ', this%g, ', ', this%b
   end subroutine print_rgb
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine print_hex(this)
      class(color), intent(in) :: this
      print'(a,a)', 'hex: ', this%hex
   end subroutine print_hex
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine print_decimal(this)
      class(color), intent(in) :: this
      print'(a,g0)', 'decimal: ', this%decimal
   end subroutine print_decimal
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine print_cmyk(this)
      class(color), intent(in) :: this
      print'(a,g0,a,g0,a,g0,a,g0)', 'cmyk: ', this%c, ', ', this%m, ', ', this%y, ', ', this%k
   end subroutine print_cmyk
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine print_xyz(this)
      class(color), intent(in) :: this
      print'(a, 3(f8.4, 2x))', "xyz: ", this%xyz_x, this%xyz_y, this%xyz_z
   end subroutine print_xyz
   !===============================================================================



   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set(this, name, r,g,b, c,m,y,k, decimal, hex, h,s,v, hl,sl,vl, xyz_x,xyz_y,xyz_z, use_library)
      class(color), intent(inout) :: this
      character(len=*), intent(in) :: name
      integer(ik),  intent(in), optional :: r, g, b, c, m, y, k, decimal
      character(len=*), intent(in), optional :: hex
      real(rk),     intent(in), optional :: h, s, v, hl, sl, vl, xyz_x, xyz_y, xyz_z
      logical,      intent(in), optional :: use_library
      logical :: use_library_

      if (present(use_library)) then
         use_library_ = use_library
      else
         use_library_ = .false.
      end if

      if (use_library_) then
         call this%set_by_name(name)
      else
         call this%set_name(name)
         if (present(r) .and. present(g) .and. present(b))                  call this%set_rgb(r, g, b)
         if (present(c) .and. present(m) .and. present(y) .and. present(k)) call this%set_cmyk(c, m, y, k)
         if (present(decimal))                                              call this%set_decimal(decimal)
         if (present(hex))                                                  call this%set_hex(hex)
         if (present(h) .and. present(s) .and. present(v))                  call this%set_hsv(h, s, v)
         if (present(hl) .and. present(sl) .and. present(vl))               call this%set_hsl(hl, sl, vl)
         if (present(xyz_x) .and. present(xyz_y) .and. present(xyz_z))      call this%set_xyz(xyz_x, xyz_y, xyz_z)
      end if
   end subroutine set
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_by_name(this, name)
      class(color),     intent(inout)        :: this
      character(len=*), intent(in)           :: name
      type(color), dimension(:), allocatable :: colors
      integer                                :: i

      call initialize_colors(colors)

      do concurrent (i = 1: size(colors))
         if (trim(colors(i)%color_name) == trim(name)) then
            this = colors(i)
         end if
      end do

   end subroutine set_by_name
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_name(this, name)
      class(color), intent(inout) :: this
      character(len=*), intent(in) :: name

      this%color_name = trim(name)
   end subroutine set_name
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_hsl(this, h, s, l)
      class(color), intent(inout) :: this
      real(rk),    intent(in)    :: h, s, l

      this%hl = h
      this%sl = s
      this%vl = l
   end subroutine set_hsl
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_hsv(this, h, s, v)
      class(color), intent(inout) :: this
      real(rk),    intent(in)    :: h, s, v

      this%h = h
      this%s = s
      this%v = v
   end subroutine set_hsv
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_rgb(this, r, g, b)
      class(color), intent(inout) :: this
      integer(ik),  intent(in)    :: r, g, b

      this%r = r
      this%g = g
      this%b = b
   end subroutine set_rgb
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_hex(this, hex)
      class(color), intent(inout) :: this
      character(len=*), intent(in) :: hex

      this%hex = hex
   end subroutine set_hex
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_decimal(this, decimal)
      class(color), intent(inout) :: this
      integer(ik),  intent(in)    :: decimal

      this%decimal = decimal
   end subroutine set_decimal
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_cmyk(this, c, m, y, k)
      class(color), intent(inout) :: this
      integer(ik),  intent(in)    :: c, m, y, k

      this%c = c
      this%m = m
      this%y = y
      this%k = k
   end subroutine set_cmyk
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine set_xyz(this, x, y, z)
      class(color), intent(inout) :: this
      real(rk),    intent(in)    :: x, y, z

      this%xyz_x = x
      this%xyz_y = y
      this%xyz_z = z
   end subroutine set_xyz
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine get(this, name, r,g,b, c,m,y,k, decimal, hex, h,s,v, hl,sl,vl, xyz_x,xyz_y,xyz_z)
      class(color), intent(inout) :: this
      character(len=*), intent(out), optional :: name
      integer(ik),  intent(out), optional :: r, g, b, c, m, y, k, decimal
      character(len=7), intent(out), optional :: hex
      real(rk),     intent(out), optional :: h, s, v, hl, sl, vl, xyz_x, xyz_y, xyz_z

      if (present(name))                                                 call this%get_name(name)
      if (present(r) .and. present(g) .and. present(b))                  call this%get_rgb(r, g, b)
      if (present(c) .and. present(m) .and. present(y) .and. present(k)) call this%get_cmyk(c, m, y, k)
      if (present(decimal))                                              call this%get_decimal(decimal)
      if (present(hex))                                                  call this%get_hex(hex)
      if (present(h) .and. present(s) .and. present(v))                  call this%get_hsv(h, s, v)
      if (present(hl) .and. present(sl) .and. present(vl))               call this%get_hsl(hl, sl, vl)
      if (present(xyz_x) .and. present(xyz_y) .and. present(xyz_z))      call this%get_xyz(xyz_x, xyz_y, xyz_z)

   end subroutine get
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine get_name(this, name)
      class(color), intent(in) :: this
      character(len=*), intent(out) :: name

      name = this%color_name
   end subroutine get_name
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine get_hsl(this, h, s, l)
      class(color), intent(in)  :: this
      real(rk),    intent(out) :: h, s, l

      h = this%hl
      s = this%sl
      l = this%vl
   end subroutine get_hsl
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine get_hsv(this, h, s, v)
      class(color), intent(in)  :: this
      real(rk),    intent(out) :: h, s, v

      h = this%h
      s = this%s
      v = this%v
   end subroutine get_hsv
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine get_decimal(this, decimal)
      class(color), intent(in)  :: this
      integer(ik),  intent(out) :: decimal

      decimal = this%decimal
   end subroutine get_decimal
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine get_cmyk(this, c, m, y, k)
      class(color), intent(in)  :: this
      integer(ik),  intent(out) :: c, m, y, k

      c = this%c
      m = this%m
      y = this%y
      k = this%k
   end subroutine get_cmyk
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine get_hex(this, hex)
      class(color), intent(in)    :: this
      character(len=*), intent(out) :: hex

      hex = this%hex
   end subroutine get_hex
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine get_rgb(this, r, g, b)
      class(color), intent(in)  :: this
      integer(ik),  intent(out) :: r, g, b

      r = this%r
      g = this%g
      b = this%b
   end subroutine get_rgb
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine get_xyz(this, x, y, z)
      class(color), intent(in)  :: this
      real(rk),    intent(out) :: x, y, z

      x = this%xyz_x
      y = this%xyz_y
      z = this%xyz_z
   end subroutine get_xyz
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine convert(this, to)
      class(color),     intent(inout) :: this
      character(len=*), intent(in)    :: to
      integer(ik)                     :: r, g, b

      select case (to)

       case ('rgb2hex')
         call rgb_to_hex(this%r, this%g, this%b, this%hex)
       case ('rgb2decimal')
         call rgb_to_decimal(this%r, this%g, this%b, this%decimal)
       case ('rgb2cmyk')
         call rgb_to_cmyk(this%r, this%g, this%b, this%c, this%m, this%y, this%k)
       case ('rgb2hsv')
         call rgb_to_hsv(this%r, this%g, this%b, this%h, this%s, this%v)
       case ('rgb2hsl')
         call rgb_to_hsl(this%r, this%g, this%b, this%hl, this%sl, this%vl)
       case ('rgb2xyz')
         call rgb_to_xyz(this%r, this%g, this%b, this%xyz_x, this%xyz_y, this%xyz_z)
       case ('rgb2all')
         call rgb_to_hex(this%r, this%g, this%b, this%hex)
         call rgb_to_decimal(this%r, this%g, this%b, this%decimal)
         call rgb_to_cmyk(this%r, this%g, this%b, this%c, this%m, this%y, this%k)
         call rgb_to_hsv(this%r, this%g, this%b, this%h, this%s, this%v)
         call rgb_to_hsl(this%r, this%g, this%b, this%hl, this%sl, this%vl)
         call rgb_to_xyz(this%r, this%g, this%b, this%xyz_x, this%xyz_y, this%xyz_z)

       case ('hex2rgb')
         call hex_to_rgb(this%hex, this%r, this%g, this%b)
       case ('hex2decimal')
         call hex_to_rgb(this%hex, r, g, b)
         call rgb_to_decimal(r, g, b, this%decimal)
       case ('hex2cmyk')
         call hex_to_rgb(this%hex, r, g, b)
         call rgb_to_cmyk(r, g, b, this%c, this%m, this%y, this%k)
       case ('hex2hsv')
         call hex_to_rgb(this%hex, r, g, b)
         call rgb_to_hsv(r, g, b, this%h, this%s, this%v)
       case ('hex2hsl')
         call hex_to_rgb(this%hex, r, g, b)
         call rgb_to_hsl(r, g, b, this%hl, this%sl, this%vl)
       case ('hex2xyz')
         call hex_to_rgb(this%hex, r, g, b)
         call rgb_to_xyz(r, g, b, this%xyz_x, this%xyz_y, this%xyz_z)
       case ('hex2all')
         call hex_to_rgb(this%hex, this%r, this%g, this%b)
         call rgb_to_decimal(this%r, this%g, this%b, this%decimal)
         call rgb_to_cmyk(this%r, this%g, this%b, this%c, this%m, this%y, this%k)
         call rgb_to_hsv(this%r, this%g, this%b, this%h, this%s, this%v)
         call rgb_to_hsl(this%r, this%g, this%b, this%hl, this%sl, this%vl)
         call rgb_to_xyz(this%r, this%g, this%b, this%xyz_x, this%xyz_y, this%xyz_z)

       case ('decimal2rgb')
         call decimal_to_rgb(this%decimal, this%r, this%g, this%b)
       case ('decimal2hex')
         call decimal_to_rgb(this%decimal, r, g, b)
         call rgb_to_hex(r, g, b, this%hex)
       case ('decimal2cmyk')
         call decimal_to_rgb(this%decimal, r, g, b)
         call rgb_to_cmyk(r, g, b, this%c, this%m, this%y, this%k)
       case ('decimal2hsv')
         call decimal_to_rgb(this%decimal, r, g, b)
         call rgb_to_hsv(r, g, b, this%h, this%s, this%v)
       case ('decimal2hsl')
         call decimal_to_rgb(this%decimal, r, g, b)
         call rgb_to_hsl(r, g, b, this%hl, this%sl, this%vl)
       case ('decimal2xyz')
         call decimal_to_rgb(this%decimal, r, g, b)
         call rgb_to_xyz(r, g, b, this%xyz_x, this%xyz_y, this%xyz_z)
       case ('decimal2all')
         call decimal_to_rgb(this%decimal, this%r, this%g, this%b)
         call rgb_to_hex(this%r, this%g, this%b, this%hex)
         call rgb_to_cmyk(this%r, this%g, this%b, this%c, this%m, this%y, this%k)
         call rgb_to_hsv(this%r, this%g, this%b, this%h, this%s, this%v)
         call rgb_to_hsl(this%r, this%g, this%b, this%hl, this%sl, this%vl)
         call rgb_to_xyz(this%r, this%g, this%b, this%xyz_x, this%xyz_y, this%xyz_z)

       case ('cmyk2rgb')
         call cmyk_to_rgb(this%c, this%m, this%y, this%k, this%r, this%g, this%b)
       case ('cmyk2hex')
         call cmyk_to_rgb(this%c, this%m, this%y, this%k, r, g, b)
         call rgb_to_hex(r, g, b, this%hex)
       case ('cmyk2decimal')
         call cmyk_to_rgb(this%c, this%m, this%y, this%k, r, g, b)
         call rgb_to_decimal(r, g, b, this%decimal)
       case ('cmyk2hsv')
         call cmyk_to_rgb(this%c, this%m, this%y, this%k, r, g, b)
         call rgb_to_hsv(r, g, b, this%h, this%s, this%v)
       case ('cmyk2hsl')
         call cmyk_to_rgb(this%c, this%m, this%y, this%k, r, g, b)
         call rgb_to_hsl(r, g, b, this%hl, this%sl, this%vl)
       case ('cmyk2xyz')
         call cmyk_to_rgb(this%c, this%m, this%y, this%k, r, g, b)
         call rgb_to_xyz(r, g, b, this%xyz_x, this%xyz_y, this%xyz_z)
       case ('cmyk2all')
         call cmyk_to_rgb(this%c, this%m, this%y, this%k, this%r, this%g, this%b)
         call rgb_to_hex(this%r, this%g, this%b, this%hex)
         call rgb_to_decimal(this%r, this%g, this%b, this%decimal)
         call rgb_to_hsv(this%r, this%g, this%b, this%h, this%s, this%v)
         call rgb_to_hsl(this%r, this%g, this%b, this%hl, this%sl, this%vl)
         call rgb_to_xyz(this%r, this%g, this%b, this%xyz_x, this%xyz_y, this%xyz_z)

       case ('hsv2rgb')
         call hsv_to_rgb(this%h, this%s, this%v, this%r, this%g, this%b)
       case ('hsv2hex')
         call hsv_to_rgb(this%h, this%s, this%v, r, g, b)
         call rgb_to_hex(r, g, b, this%hex)
       case ('hsv2decimal')
         call hsv_to_rgb(this%h, this%s, this%v, r, g, b)
         call rgb_to_decimal(r, g, b, this%decimal)
       case ('hsv2cmyk')
         call hsv_to_rgb(this%h, this%s, this%v, r, g, b)
         call rgb_to_cmyk(r, g, b, this%c, this%m, this%y, this%k)
       case ('hsv2hsl')
         call hsv_to_rgb(this%h, this%s, this%v, r, g, b)
         call rgb_to_hsl(r, g, b, this%hl, this%sl, this%vl)
       case ('hsv2xyz')
         call hsv_to_rgb(this%h, this%s, this%v, r, g, b)
         call rgb_to_xyz(r, g, b, this%xyz_x, this%xyz_y, this%xyz_z)
       case ('hsv2all')
         call hsv_to_rgb(this%h, this%s, this%v, this%r, this%g, this%b)
         call rgb_to_hex(this%r, this%g, this%b, this%hex)
         call rgb_to_decimal(this%r, this%g, this%b, this%decimal)
         call rgb_to_cmyk(this%r, this%g, this%b, this%c, this%m, this%y, this%k)
         call rgb_to_hsl(this%r, this%g, this%b, this%hl, this%sl, this%vl)
         call rgb_to_xyz(this%r, this%g, this%b, this%xyz_x, this%xyz_y, this%xyz_z)

       case ('hsl2hsv')
         call hsl_to_rgb(this%hl, this%sl, this%vl, r, g, b)
         call rgb_to_hsv(r, g, b, this%h, this%s, this%v)
       case ('hsl2rgb')
         call hsl_to_rgb(this%hl, this%sl, this%vl, this%r, this%g, this%b)
       case ('hsl2hex')
         call hsl_to_rgb(this%hl, this%sl, this%vl, r, g, b)
         call rgb_to_hex(r, g, b, this%hex)
       case ('hsl2decimal')
         call hsl_to_rgb(this%hl, this%sl, this%vl, r, g, b)
         call rgb_to_decimal(r, g, b, this%decimal)
       case ('hsl2cmyk')
         call hsl_to_rgb(this%hl, this%sl, this%vl, r, g, b)
         call rgb_to_cmyk(r, g, b, this%c, this%m, this%y, this%k)
       case ('hsl2xyz')
         call hsl_to_rgb(this%hl, this%sl, this%vl, r, g, b)
         call rgb_to_xyz(r, g, b, this%xyz_x, this%xyz_y, this%xyz_z)
       case ('hsl2all')
         call hsl_to_rgb(this%hl, this%sl, this%vl, this%r, this%g, this%b)
         call rgb_to_hex(this%r, this%g, this%b, this%hex)
         call rgb_to_decimal(this%r, this%g, this%b, this%decimal)
         call rgb_to_cmyk(this%r, this%g, this%b, this%c, this%m, this%y, this%k)
         call rgb_to_hsv(this%r, this%g, this%b, this%h, this%s, this%v)
         call rgb_to_xyz(this%r, this%g, this%b, this%xyz_x, this%xyz_y, this%xyz_z)

       case ('xyz2rgb')
         call xyz_to_rgb(this%xyz_x, this%xyz_y, this%xyz_z, this%r, this%g, this%b)
       case ('xyz2hex')
         call xyz_to_rgb(this%xyz_x, this%xyz_y, this%xyz_z, r, g, b)
         call rgb_to_hex(r, g, b, this%hex)
       case ('xyz2decimal')
         call xyz_to_rgb(this%xyz_x, this%xyz_y, this%xyz_z, r, g, b)
         call rgb_to_decimal(r, g, b, this%decimal)
       case ('xyz2cmyk')
         call xyz_to_rgb(this%xyz_x, this%xyz_y, this%xyz_z, r, g, b)
         call rgb_to_cmyk(r, g, b, this%c, this%m, this%y, this%k)
       case ('xyz2hsv')
         call xyz_to_rgb(this%xyz_x, this%xyz_y, this%xyz_z, r, g, b)
         call rgb_to_hsv(r, g, b, this%h, this%s, this%v)
       case ('xyz2hsl')
         call xyz_to_rgb(this%xyz_x, this%xyz_y, this%xyz_z, r, g, b)
         call rgb_to_hsl(r, g, b, this%hl, this%sl, this%vl)
       case ('xyz2all')
         call xyz_to_rgb(this%xyz_x, this%xyz_y, this%xyz_z, this%r, this%g, this%b)
         call rgb_to_hex(this%r, this%g, this%b, this%hex)
         call rgb_to_decimal(this%r, this%g, this%b, this%decimal)
         call rgb_to_cmyk(this%r, this%g, this%b, this%c, this%m, this%y, this%k)
         call rgb_to_hsv(this%r, this%g, this%b, this%h, this%s, this%v)
         call rgb_to_hsl(this%r, this%g, this%b, this%hl, this%sl, this%vl)

      end select
   end subroutine convert
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine rgb_to_hex(r, g, b, hex)
      integer(ik),      intent(in)  :: r, g, b
      character(len=7), intent(out) :: hex

      write(hex, '("#",3(z2.2))') r, g, b
   end subroutine rgb_to_hex
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine rgb_to_decimal(r, g, b, decimal)
      implicit none
      integer(ik), intent(in)  :: r, g, b
      integer(ik), intent(out) :: decimal

      decimal = r*65536_ik + g*256_ik + b
   end subroutine rgb_to_decimal
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine rgb_to_cmyk(r, g, b, c, m, y, k)
      integer(ik), intent(in)  :: r, g, b
      integer(ik), intent(out) :: c, m, y, k
      real(rk)                 :: rn, gn, bn
      real(rk)                 :: cr, mr, yr, kr

      rn = r/255.0_rk
      gn = g/255.0_rk
      bn = b/255.0_rk

      kr = 1.0_rk - max(rn, gn, bn)

      if (abs(kr - 1.0_rk) < 1.0e-6_rk) then
         cr = 0.0_rk
         mr = 0.0_rk
         yr = 0.0_rk
      else
         cr = (1.0_rk-rn-kr)/(1.0_rk-kr)
         mr = (1.0_rk-gn-kr)/(1.0_rk-kr)
         yr = (1.0_rk-bn-kr)/(1.0_rk-kr)
      end if

      c = nint(cr*100.0_rk, kind=ik)
      m = nint(mr*100.0_rk, kind=ik)
      y = nint(yr*100.0_rk, kind=ik)
      k = nint(kr*100.0_rk, kind=ik)
   end subroutine rgb_to_cmyk
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine hex_to_rgb(hex, r, g, b)
      character(len=*), intent(in)  :: hex
      integer(ik),      intent(out) :: r, g, b

      read(hex(2:3), '(z2)') r
      read(hex(4:5), '(z2)') g
      read(hex(6:7), '(z2)') b
   end subroutine hex_to_rgb
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine decimal_to_rgb(decimal, r, g, b)
      integer(ik), intent(in)  :: decimal
      integer(ik), intent(out) :: r, g, b

      r = mod(decimal / 65536_ik, 256_ik)
      g = mod(decimal / 256_ik, 256_ik)
      b = mod(decimal, 256_ik)
   end subroutine decimal_to_rgb
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine cmyk_to_rgb(c, m, y, k, r, g, b)
      integer(ik), intent(in)  :: c, m, y, k
      integer(ik), intent(out) :: r, g, b
      real(rk) :: cr, mg, yl

      cr = real(c, kind=rk) / 100.0_rk
      mg = real(m, kind=rk) / 100.0_rk
      yl = real(y, kind=rk) / 100.0_rk

      r = nint(255.0_rk * (1.0_rk - cr) * (1.0_rk - real(k, kind=rk) / 100.0_rk), kind=ik)
      g = nint(255.0_rk * (1.0_rk - mg) * (1.0_rk - real(k, kind=rk) / 100.0_rk), kind=ik)
      b = nint(255.0_rk * (1.0_rk - yl) * (1.0_rk - real(k, kind=rk) / 100.0_rk), kind=ik)
   end subroutine cmyk_to_rgb
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine hsv_to_rgb(h, s, v, r, g, b)
      real(rk), intent(in) :: h, s, v
      integer, intent(out) :: r, g, b
      real(rk) :: c, h_prime, x, m
      real(rk) :: h_dash, r1, g1, b1

      c = v/100.0_rk * s/100.0_rk
      h_prime = h / 60.0_rk

      h_dash = mod(h_prime, 6.0_rk)
      x = c * (1.0_rk - abs(h_dash - 2.0_rk * floor(h_dash / 2.0_rk) - 1.0_rk))

      select case (int(h_dash))
       case (0)
         r1 = c
         g1 = x
         b1 = 0.0_rk
       case (1)
         r1 = x
         g1 = c
         b1 = 0.0_rk
       case (2)
         r1 = 0.0_rk
         g1 = c
         b1 = x
       case (3)
         r1 = 0.0_rk
         g1 = x
         b1 = c
       case (4)
         r1 = x
         g1 = 0.0_rk
         b1 = c
       case (5)
         r1 = c
         g1 = 0.0_rk
         b1 = x
       case default
         r1 = 0.0_rk
         g1 = 0.0_rk
         b1 = 0.0_rk
      end select

      m = v/100.0_rk - c
      r = nint(255.0_rk * (r1 + m), kind=ik)
      g = nint(255.0_rk * (g1 + m), kind=ik)
      b = nint(255.0_rk * (b1 + m), kind=ik)

      r = max(0, min(255, r))
      g = max(0, min(255, g))
      b = max(0, min(255, b))
   end subroutine hsv_to_rgb
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine rgb_to_hsv(r, g, b, h, s, v)
      integer(ik), intent(in)  :: r, g, b
      real(rk),    intent(out) :: h, s, v
      real(rk) :: rn, gn, bn, cmax, cmin, delta

      rn = real(r, kind=rk) / 255.0_rk
      gn = real(g, kind=rk) / 255.0_rk
      bn = real(b, kind=rk) / 255.0_rk

      cmax = max(rn, max(gn, bn))
      cmin = min(rn, min(gn, bn))
      delta = cmax - cmin

      v = cmax

      if (delta < 1e-6_rk) then
         h = 0.0_rk
         s = 0.0_rk
      else
         if (cmax > 0.0_rk) then
            s = delta / cmax
            if (abs(cmax - rn) < 1.0e-6_rk) then
               h = 60.0_rk * mod(((gn - bn) / delta), 6.0_rk)
            elseif (abs(cmax - gn) < 1.0e-6_rk) then
               h = 60.0_rk * (((bn - rn) / delta) + 2.0_rk)
            else
               h = 60.0_rk * (((rn - gn) / delta) + 4.0_rk)
            end if
         end if

         if (h < 0.0_rk) h = h + 360.0_rk
      end if

      s = s * 100.0_rk
      v = v * 100.0_rk
   end subroutine rgb_to_hsv
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine rgb_to_hsl(r, g, b, h, s, l)
      integer, intent(in) :: r, g, b
      real(rk), intent(out) :: h, s, l
      real(rk) :: rn, gn, bn
      real(rk) :: cmax, cmin

      rn = real(r, kind=rk) / 255.0_rk
      gn = real(g, kind=rk) / 255.0_rk
      bn = real(b, kind=rk) / 255.0_rk

      cmax = max(rn, max(gn, bn))
      cmin = min(rn, min(gn, bn))

      l = (cmax + cmin) / 2.0_rk

      if (abs(cmax - cmin) < 1e-6_rk) then
         s = 0.0_rk
      else
         if (l <= 0.5_rk) then
            s = (cmax - cmin) / (cmax + cmin)
         else
            s = (cmax - cmin) / (2.0_rk - cmax - cmin)
         end if
      end if

      if (abs(cmax - cmin) < 1e-6_rk) then
         h = 0.0_rk
      elseif (abs(cmax - rn) < 1e-6_rk) then
         h = 60.0_rk * mod((gn - bn) / (cmax - cmin), 6.0_rk)
      else if (abs(cmax - gn) < 1e-6_rk) then
         h = 60.0_rk * ((bn - rn) / (cmax - cmin) + 2.0_rk)
      else if (abs(cmax - bn) < 1e-6_rk) then
         h = 60.0_rk * ((rn - gn) / (cmax - cmin) + 4.0_rk)
      end if

      if (h < 0.0_rk) then
         h = h + 360.0_rk
      end if

      s = s*100.0_rk
      l = l*100.0_rk
   end subroutine rgb_to_hsl
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine hsl_to_rgb(h, s, l, r, g, b)
      real(rk), intent(in) :: h, s, l
      integer(ik), intent(out) :: r, g, b
      real(rk) :: hn, sn, ln
      real(rk) :: c, h_prime, x, m
      real(rk) :: r1, g1, b1

      hn = h
      sn = s / 100.0_rk
      ln = l / 100.0_rk

      c = (1.0_rk - abs(2.0_rk * ln - 1.0_rk)) * sn

      h_prime = mod(hn, 360.0_rk) / 60.0_rk

      x = c * (1.0_rk - abs(mod(h_prime, 2.0_rk) - 1.0_rk))

      select case (int(h_prime))
       case (0)
         r1 = c
         g1 = x
         b1 = 0.0_rk
       case (1)
         r1 = x
         g1 = c
         b1 = 0.0_rk
       case (2)
         r1 = 0.0_rk
         g1 = c
         b1 = x
       case (3)
         r1 = 0.0_rk
         g1 = x
         b1 = c
       case (4)
         r1 = x
         g1 = 0.0_rk
         b1 = c
       case (5)
         r1 = c
         g1 = 0.0_rk
         b1 = x
      end select

      m = ln - c / 2.0_rk

      r = nint(r1 * 255.0_rk + m * 255.0_rk, kind=ik)
      g = nint(g1 * 255.0_rk + m * 255.0_rk, kind=ik)
      b = nint(b1 * 255.0_rk + m * 255.0_rk, kind=ik)
   end subroutine hsl_to_rgb
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine rgb_to_xyz(r, g, b, x, y, z)
      integer(ik), intent(in) :: r, g, b
      real(rk), intent(out) :: x, y, z
      real(rk) :: rn, gn, bn

      ! Normalize RGB values to the range [0, 1]
      rn = real(r, kind=rk) / 255.0_rk
      gn = real(g, kind=rk) / 255.0_rk
      bn = real(b, kind=rk) / 255.0_rk

      ! Apply gamma correction
      if (rn <= 0.04045_rk) then
         rn = rn / 12.92_rk
      else
         rn = ((rn + 0.055_rk) / 1.055_rk) ** 2.4_rk
      end if

      if (gn <= 0.04045_rk) then
         gn = gn / 12.92_rk
      else
         gn = ((gn + 0.055_rk) / 1.055_rk) ** 2.4_rk
      end if

      if (bn <= 0.04045_rk) then
         bn = bn / 12.92_rk
      else
         bn = ((bn + 0.055_rk) / 1.055_rk) ** 2.4_rk
      end if

      ! Convert RGB to XYZ using defined transformation matrix
      x = 0.4124564_rk * rn + 0.3575761_rk * gn + 0.1804375_rk * bn
      y = 0.2126729_rk * rn + 0.7151522_rk * gn + 0.0721750_rk * bn
      z = 0.0193339_rk * rn + 0.1191920_rk * gn + 0.9503041_rk * bn

      x = x*100.0_rk
      y = y*100.0_rk
      z = z*100.0_rk
   end subroutine rgb_to_xyz
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine xyz_to_rgb(x, y, z, r, g, b)
      real(rk), intent(in) :: x, y, z
      integer(ik), intent(out) :: r, g, b
      real(rk) :: rn, gn, bn
      real(rk) :: x1, y1, z1

      x1 = x/100.0_rk
      y1 = y/100.0_rk
      z1 = z/100.0_rk

      ! Convert XYZ to linear RGB
      rn =  3.2404542_rk*x1  -1.5371385_rk*y1 -0.4985314_rk*z1
      gn = -0.9692660_rk*x1  +1.8760108_rk*y1 +0.0415560_rk*z1
      bn =  0.0556434_rk*x1  -0.2040259_rk*y1 +1.0572252_rk*z1

      ! Apply gamma correction
      if (rn <= 0.0031308_rk) then
         rn = 12.92_rk * rn
      else
         rn = 1.055_rk * (rn ** (1.0_rk / 2.4_rk)) - 0.055_rk
      end if

      if (gn <= 0.0031308_rk) then
         gn = 12.92_rk * gn
      else
         gn = 1.055_rk * (gn ** (1.0_rk / 2.4_rk)) - 0.055_rk
      end if

      if (bn <= 0.0031308_rk) then
         bn = 12.92_rk * bn
      else
         bn = 1.055_rk * (bn ** (1.0_rk / 2.4_rk)) - 0.055_rk
      end if

      ! Scale and convert to integer RGB values
      r = nint(rn*255.0_rk, kind=ik)
      g = nint(gn*255.0_rk, kind=ik)
      b = nint(bn*255.0_rk, kind=ik)

   end subroutine xyz_to_rgb
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine copy_color(this, from)
      class(color), intent(inout) :: this
      class(color), intent(in)    :: from

      this%r = from%r
      this%g = from%g
      this%b = from%b

      this%c = from%c
      this%m = from%m
      this%y = from%y
      this%k = from%k

      this%decimal = from%decimal

      this%hex = from%hex

      this%h = from%h
      this%s = from%s
      this%v = from%v

      this%hl = from%hl
      this%sl = from%sl
      this%vl = from%vl

      this%color_name = from%color_name

   end subroutine copy_color
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental pure subroutine find_nearest(this, nearest_color)
      class(color), intent(inout) :: this
      type(color),  intent(out)   :: nearest_color
      integer(ik) :: i, closestColorIndex, ri, gi, bi
      real(rk)    :: dist, min_dist
      type(color), dimension(:), allocatable :: colors

      call initialize_colors(colors)

      min_dist = huge(min_dist)
      closestColorIndex = 0

      do concurrent (i = 1: size(colors))
         call colors(i)%get_rgb(ri, gi, bi)
         dist = sqrt(&
            (real((ri-this%r), kind=rk)/255.0_rk)**2&
            + (real((gi-this%g), kind=rk)/255.0_rk)**2&
            + (real((bi-this%b), kind=rk)/255.0_rk)**2&
            )
         if (dist < min_dist) then
            min_dist = dist
            closestColorIndex = i
         end if
      end do

      if (closestColorIndex == 0) then
         error stop 'error: no color found'
      else
         nearest_color = colors(closestColorIndex)
      end if

   end subroutine find_nearest
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine print_available_colors(this)
      class(color), intent(inout) :: this
      type(color), dimension(:), allocatable :: colors

      call initialize_colors(colors)
      call colors(:)%print()
   end subroutine print_available_colors
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine save(this, file_name, height, width)
      class(color), intent(inout) :: this
      character(len=*), intent(in), optional :: file_name
      integer, intent(in), optional :: height, width
      type(format_pnm) :: image
      integer :: height_, width_
      integer(ik), dimension(:,:), allocatable :: px

      if (present(height)) then
         height_ = height
      else
         height_ = 50
      end if
      if (present(width)) then
         width_ = width
      else
         width_ = 50
      end if

      allocate(px(height_, 3*width_))

      px(:,1:3*width_-2:3) = this%r
      px(:,2:3*width_-1:3) = this%g
      px(:,3:3*width_-0:3) = this%b

      call image%set_pnm(&
         encoding    = 'binary', &
         file_format = 'ppm', &
         width       = width_, &
         height      = height_, &
         max_color   = 255, &
         comment     = trim(this%color_name), &
         pixels      = px &
         )

      if (present(file_name)) then
         call image%export_pnm(trim(file_name))
      else
         call image%export_pnm('pnm_files/colors/'//trim(this%color_name))
      end if

   end subroutine save
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   elemental impure subroutine save_available_colors(this, file_name, height, width)
      class(color), intent(inout) :: this
      character(len=*), intent(in), optional :: file_name
      integer, intent(in), optional  :: height, width
      type(color), dimension(:), allocatable :: colors

      call initialize_colors(colors)
      call colors(:)%save(file_name, height, width)
   end subroutine save_available_colors
   !===============================================================================

end module forcolor
