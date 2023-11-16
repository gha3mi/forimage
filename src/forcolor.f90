module forcolor

   use forimage_parameters, only: rk, ik

   implicit none

   private

   public :: color

   !===============================================================================
   type :: color
      integer(ik)     , private :: r=0_ik, g=0_ik, b=0_ik            !! rgb
      integer(ik)     , private :: c=0_ik, m=0_ik, y=0_ik, k=0_ik    !! cmyk
      integer(ik)     , private :: decimal=0_ik                      !! decimal
      character(len=7), private :: hex='#000000'                     !! hex
      real(rk)        , private :: h=0.0_rk, s=0.0_rk, v=0.0_rk      !! hsv
      real(rk)        , private :: hl=0.0_rk, sl=0.0_rk, vl=0.0_rk   !! hsl
   contains
      procedure :: set_rgb
      procedure :: set_hex
      procedure :: set_decimal
      procedure :: set_cmyk
      procedure :: set_hsv
      procedure :: set_hsl
      procedure :: convert
      procedure :: get_rgb
      procedure :: get_hex
      procedure :: get_decimal
      procedure :: get_cmyk
      procedure :: get_hsv
      procedure :: get_hsl
      procedure :: print_rgb
      procedure :: print_hex
      procedure :: print_decimal
      procedure :: print_cmyk
      procedure :: print_hsv
      procedure :: print_hsl
   end type color
   !===============================================================================

contains

   !===============================================================================
   !> author: seyed ali ghasemi
   elemental pure subroutine set_hsl(this, h, s, l)
      class(color), intent(inout) :: this
      real(rk),    intent(in)    :: h, s, l

      this%hl = h
      this%sl = s
      this%vl = l
   end subroutine set_hsl
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental pure subroutine get_hsl(this, h, s, l)
      class(color), intent(in)  :: this
      real(rk),    intent(out) :: h, s, l

      h = this%hl
      s = this%sl
      l = this%vl
   end subroutine get_hsl
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental impure subroutine print_hsl(this)
      class(color), intent(in) :: this
      print '(a, 3(f8.4, 2x))', "hsl: ", this%hl, this%sl, this%vl
   end subroutine print_hsl
   !===============================================================================


   !===============================================================================
   elemental pure subroutine set_hsv(this, h, s, v)
      class(color), intent(inout) :: this
      real(rk),    intent(in)    :: h, s, v

      this%h = h
      this%s = s
      this%v = v
   end subroutine set_hsv
   !===============================================================================

   !===============================================================================
   elemental pure subroutine get_hsv(this, h, s, v)
      class(color), intent(in)  :: this
      real(rk),    intent(out) :: h, s, v

      h = this%h
      s = this%s
      v = this%v
   end subroutine get_hsv
   !===============================================================================

   !===============================================================================
   elemental impure subroutine print_hsv(this)
      class(color), intent(in) :: this
      print '(a, 3(f8.4, 2x))', "hsv: ", this%h, this%s, this%v
   end subroutine print_hsv
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental impure subroutine print_rgb(this)
      class(color), intent(in) :: this
      print'(a,g0,a,g0,a,g0)', 'rgb: ', this%r, ', ', this%g, ', ', this%b
   end subroutine print_rgb
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental impure subroutine print_hex(this)
      class(color), intent(in) :: this
      print'(a,a)', 'hex: ', this%hex
   end subroutine print_hex
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental impure subroutine print_decimal(this)
      class(color), intent(in) :: this
      print'(a,g0)', 'decimal: ', this%decimal
   end subroutine print_decimal
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental impure subroutine print_cmyk(this)
      class(color), intent(in) :: this
      print'(a,g0,a,g0,a,g0,a,g0)', 'cmyk: ', this%c, ', ', this%m, ', ', this%y, ', ', this%k
   end subroutine print_cmyk
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental pure subroutine set_rgb(this, r, g, b)
      class(color), intent(inout) :: this
      integer(ik),  intent(in)    :: r, g, b

      this%r = r
      this%g = g
      this%b = b
   end subroutine set_rgb
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental pure subroutine set_hex(this, hex)
      class(color), intent(inout) :: this
      character(len=*), intent(in) :: hex

      this%hex = hex
   end subroutine set_hex
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental pure subroutine set_decimal(this, decimal)
      class(color), intent(inout) :: this
      integer(ik),  intent(in)    :: decimal

      this%decimal = decimal
   end subroutine set_decimal
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
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
   !> author: seyed ali ghasemi
   elemental pure subroutine get_decimal(this, decimal)
      class(color), intent(in)  :: this
      integer(ik),  intent(out) :: decimal

      decimal = this%decimal
   end subroutine get_decimal
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
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
   !> author: seyed ali ghasemi
   elemental pure subroutine get_hex(this, hex)
      class(color), intent(in)    :: this
      character(len=*), intent(out) :: hex

      hex = this%hex
   end subroutine get_hex
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental pure subroutine get_rgb(this, r, g, b)
      class(color), intent(in)  :: this
      integer(ik),  intent(out) :: r, g, b

      r = this%r
      g = this%g
      b = this%b
   end subroutine get_rgb
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental pure subroutine convert(this, to)
      class(color),     intent(inout) :: this
      character(len=*), intent(in)    :: to
      integer(ik)                     :: r, g, b
      real(rk)                        :: h, s, v

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

      end select
   end subroutine convert
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental pure subroutine rgb_to_hex(r, g, b, hex)
      integer(ik),      intent(in)  :: r, g, b
      character(len=7), intent(out) :: hex

      write(hex, '("#",3(z2))') r, g, b
   end subroutine rgb_to_hex
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental pure subroutine rgb_to_decimal(r, g, b, decimal)
      implicit none
      integer(ik), intent(in)  :: r, g, b
      integer(ik), intent(out) :: decimal

      decimal = r*65536_ik + g*256_ik + b
   end subroutine rgb_to_decimal
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
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
   !> author: seyed ali ghasemi
   elemental pure subroutine hex_to_rgb(hex, r, g, b)
      character(len=*), intent(in)  :: hex
      integer(ik),      intent(out) :: r, g, b

      read(hex(2:3), '(z2)') r
      read(hex(4:5), '(z2)') g
      read(hex(6:7), '(z2)') b
   end subroutine hex_to_rgb
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental pure subroutine decimal_to_rgb(decimal, r, g, b)
      integer(ik), intent(in)  :: decimal
      integer(ik), intent(out) :: r, g, b

      r = mod(decimal / 65536_ik, 256_ik)
      g = mod(decimal / 256_ik, 256_ik)
      b = mod(decimal, 256_ik)
   end subroutine decimal_to_rgb
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
   elemental pure subroutine cmyk_to_rgb(c, m, y, k, r, g, b)
      integer(ik), intent(in)  :: c, m, y, k
      integer(ik), intent(out) :: r, g, b
      real(rk) :: cr, mg, yl

      cr = real(c, kind=rk) / 100.0_rk
      mg = real(m, kind=rk) / 100.0_rk
      yl = real(y, kind=rk) / 100.0_rk

      r = nint(255.0_rk * (1.0_rk - cr) * (1.0_rk - real(k, kind=rk) / 100.0_rk))
      g = nint(255.0_rk * (1.0_rk - mg) * (1.0_rk - real(k, kind=rk) / 100.0_rk))
      b = nint(255.0_rk * (1.0_rk - yl) * (1.0_rk - real(k, kind=rk) / 100.0_rk))
   end subroutine cmyk_to_rgb
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
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
      r = nint(255.0_rk * (r1 + m))
      g = nint(255.0_rk * (g1 + m))
      b = nint(255.0_rk * (b1 + m))

      r = max(0, min(255, r))
      g = max(0, min(255, g))
      b = max(0, min(255, b))
   end subroutine hsv_to_rgb
   !===============================================================================


   !===============================================================================
   !> author: seyed ali ghasemi
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
   !> author: seyed ali ghasemi
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

      if (cmax == cmin) then
         s = 0.0_rk
      else
         if (l <= 0.5_rk) then
            s = (cmax - cmin) / (cmax + cmin)
         else
            s = (cmax - cmin) / (2.0_rk - cmax - cmin)
         end if
      end if

      if (cmax == rn) then
         h = 60.0_rk * mod((gn - bn) / (cmax - cmin), 6.0_rk)
      else if (cmax == gn) then
         h = 60.0_rk * ((bn - rn) / (cmax - cmin) + 2.0_rk)
      else if (cmax == bn) then
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
   !> author: seyed ali ghasemi
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

      r = nint(r1 * 255.0_rk + m * 255.0_rk)
      g = nint(g1 * 255.0_rk + m * 255.0_rk)
      b = nint(b1 * 255.0_rk + m * 255.0_rk)
   end subroutine hsl_to_rgb
   !===============================================================================

end module forcolor
