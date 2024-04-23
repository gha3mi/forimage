program example26

   use forimage, only: rk, ik, color
   implicit none

   type(color)         :: custom_color
   integer(ik)         :: r, g, b
   character(len=7)    :: hex
   integer(ik)         :: decimal
   integer(ik)         :: c, m, y, k
   real(rk)            :: h, s, v
   real(rk)            :: hl, sl, vl
   real(rk)            :: xyz_x, xyz_y, xyz_z
   character(len=30)   :: name
   real(rk), parameter :: tol = 1e-4_rk


   ! Set the color using RGB values
   call custom_color%set(name='custom_color', r=245_ik, g=127_ik, b=64_ik)

   ! Convert the color to other color spaces
   call custom_color%convert('rgb2all')

   ! Get the name of the color
   call custom_color%get(name)

   ! Get the values of the color in other color spaces
   call custom_color%get(r=r, g=g, b=b)
   call custom_color%get(hex=hex)
   call custom_color%get(decimal=decimal)
   call custom_color%get(c=c, m=m, y=y, k=k)
   call custom_color%get(h=h, s=s, v=v)
   call custom_color%get(hl=hl, sl=sl, vl=vl)
   call custom_color%get(xyz_x=xyz_x, xyz_y=xyz_y, xyz_z=xyz_z)

   !
   call custom_color%print()

   ! Check the values
   call check(tol, name, r, g, b, hex, decimal, c, m, y, k, h, s, v, hl, sl, vl, xyz_x, xyz_y, xyz_z)



   ! Set the color using a hex value
   call custom_color%set(name='custom_color', hex='#F57F40')

   ! Convert the color to other color spaces
   call custom_color%convert('hex2all')

   ! Get the values of the color in other color spaces
   call custom_color%get(r=r, g=g, b=b)
   call custom_color%get(hex=hex)
   call custom_color%get(decimal=decimal)
   call custom_color%get(c=c, m=m, y=y, k=k)
   call custom_color%get(h=h, s=s, v=v)
   call custom_color%get(hl=hl, sl=sl, vl=vl)
   call custom_color%get(xyz_x=xyz_x, xyz_y=xyz_y, xyz_z=xyz_z)

   !
   call custom_color%print()

   ! Check the values
   call check(tol, name, r, g, b, hex, decimal, c, m, y, k, h, s, v, hl, sl, vl, xyz_x, xyz_y, xyz_z)



   ! Set the color using a decimal value
   call custom_color%set(name='custom_color', decimal=16088896_ik)

   ! Convert the color to other color spaces
   call custom_color%convert('decimal2all')

   ! Get the values of the color in other color spaces
   call custom_color%get(r=r, g=g, b=b)
   call custom_color%get(hex=hex)
   call custom_color%get(decimal=decimal)
   call custom_color%get(c=c, m=m, y=y, k=k)
   call custom_color%get(h=h, s=s, v=v)
   call custom_color%get(hl=hl, sl=sl, vl=vl)
   call custom_color%get(xyz_x=xyz_x, xyz_y=xyz_y, xyz_z=xyz_z)

   !
   call custom_color%print()

   ! Check the values
   call check(tol, name, r, g, b, hex, decimal, c, m, y, k, h, s, v, hl, sl, vl, xyz_x, xyz_y, xyz_z)



   ! Set the color using a decimal value
   call custom_color%set(name='custom_color', c=0_ik, m=48_ik, y=74_ik, k=4_ik)

   ! Convert the color to other color spaces
   call custom_color%convert('cmyk2all')

   ! Get the values of the color in other color spaces
   call custom_color%get(r=r, g=g, b=b)
   call custom_color%get(hex=hex)
   call custom_color%get(decimal=decimal)
   call custom_color%get(c=c, m=m, y=y, k=k)
   call custom_color%get(h=h, s=s, v=v)
   call custom_color%get(hl=hl, sl=sl, vl=vl)
   call custom_color%get(xyz_x=xyz_x, xyz_y=xyz_y, xyz_z=xyz_z)

   !
   call custom_color%print()

   ! Check the values
   call check(tol, name, r, g, b, hex, decimal, c, m, y, k, h, s, v, hl, sl, vl, xyz_x, xyz_y, xyz_z)



   ! Set the color using a hsv value
   call custom_color%set(name='custom_color', h=20.8840_rk, s=73.8776_rk, v=96.0784_rk)

   ! Convert the color to other color spaces
   call custom_color%convert('hsv2all')

   ! Get the values of the color in other color spaces
   call custom_color%get(r=r, g=g, b=b)
   call custom_color%get(hex=hex)
   call custom_color%get(decimal=decimal)
   call custom_color%get(c=c, m=m, y=y, k=k)
   call custom_color%get(h=h, s=s, v=v)
   call custom_color%get(hl=hl, sl=sl, vl=vl)
   call custom_color%get(xyz_x=xyz_x, xyz_y=xyz_y, xyz_z=xyz_z)

   !
   call custom_color%print()

   ! Check the values
   call check(tol, name, r, g, b, hex, decimal, c, m, y, k, h, s, v, hl, sl, vl, xyz_x, xyz_y, xyz_z)



   ! Set the color using a hsv value
   call custom_color%set(name='custom_color', hl=20.8840_rk, sl=90.0498_rk, vl=60.5882_rk)

   ! Convert the color to other color spaces
   call custom_color%convert('hsl2all')

   ! Get the values of the color in other color spaces
   call custom_color%get(r=r, g=g, b=b)
   call custom_color%get(hex=hex)
   call custom_color%get(decimal=decimal)
   call custom_color%get(c=c, m=m, y=y, k=k)
   call custom_color%get(h=h, s=s, v=v)
   call custom_color%get(hl=hl, sl=sl, vl=vl)
   call custom_color%get(xyz_x=xyz_x, xyz_y=xyz_y, xyz_z=xyz_z)

   !
   call custom_color%print()

   ! Check the values
   call check(tol, name, r, g, b, hex, decimal, c, m, y, k, h, s, v, hl, sl, vl, xyz_x, xyz_y, xyz_z)



   ! Set the color using a hsv value
   call custom_color%set(name='custom_color', xyz_x=46.1753_rk, xyz_y=34.9669_rk, xyz_z=9.1672_rk)

   ! Convert the color to other color spaces
   call custom_color%convert('xyz2all')

   ! Get the values of the color in other color spaces
   call custom_color%get(r=r, g=g, b=b)
   call custom_color%get(hex=hex)
   call custom_color%get(decimal=decimal)
   call custom_color%get(c=c, m=m, y=y, k=k)
   call custom_color%get(h=h, s=s, v=v)
   call custom_color%get(hl=hl, sl=sl, vl=vl)
   call custom_color%get(xyz_x=xyz_x, xyz_y=xyz_y, xyz_z=xyz_z)

   !
   call custom_color%print()

   ! Check the values
   call check(tol, name, r, g, b, hex, decimal, c, m, y, k, h, s, v, hl, sl, vl, xyz_x, xyz_y, xyz_z)



contains

   subroutine check(tol, name, r, g, b, hex, decimal, c, m, y, k, h, s, v, hl, sl, vl, xyz_x, xyz_y, xyz_z)
      character(len=*), intent(in) :: name
      integer(ik),      intent(in) :: r, g, b
      character(len=*), intent(in) :: hex
      integer(ik),      intent(in) :: decimal
      integer(ik),      intent(in) :: c, m, y, k
      real(rk),         intent(in) :: h, s, v
      real(rk),         intent(in) :: hl, sl, vl
      real(rk),         intent(in) :: xyz_x, xyz_y, xyz_z
      real(rk),         intent(in) :: tol

      ! check output:
      if (name    /= 'custom_color')                 print *, 'ERROR: name /= ''custom_color'''
      if (r       /= 245_ik)                         print *, 'ERROR: r /= 245'
      if (g       /= 127_ik)                         print *, 'ERROR: g /= 127'
      if (b       /= 64_ik)                          print *, 'ERROR: b /= 64'
      if (hex     /= '#F57F40')                      print *, 'ERROR: hex /= ''#F57F40'''
      if (decimal /= 16088896_ik)                    print *, 'ERROR: decimal /= 16088896'
      if (c       /= 0_ik)                           print *, 'ERROR: c /= 0'
      if (m       /= 48_ik)                          print *, 'ERROR: m /= 48'
      if (y       /= 74_ik)                          print *, 'ERROR: y /= 74'
      if (k       /= 4_ik)                           print *, 'ERROR: k /= 4'
      if (abs(h     - 20.883977900552487_rk) > tol ) print *, 'ERROR: h /= 20.8840'
      if (abs(s     - 73.877551020408163_rk) > tol ) print *, 'ERROR: s /= 73.8776'
      if (abs(v     - 96.078431372549019_rk) > tol ) print *, 'ERROR: v /= 96.0784'
      if (abs(hl    - 20.883977900552487_rk) > tol ) print *, 'ERROR: hl /= 20.8840'
      if (abs(sl    - 90.049751243781117_rk) > tol ) print *, 'ERROR: sl /= 90.0498'
      if (abs(vl    - 60.588235294117652_rk) > tol ) print *, 'ERROR: vl /= 60.5882'
      if (abs(xyz_x - 46.175296219509761_rk) > tol ) print *, 'ERROR: xyz_x /= 46.1753'
      if (abs(xyz_y - 34.966900449347115_rk) > tol ) print *, 'ERROR: xyz_y /= 34.9669'
      if (abs(xyz_z - 9.1671542959237478_rk) > tol ) print *, 'ERROR: xyz_z /= 9.1672'
   end subroutine check
end program example26
