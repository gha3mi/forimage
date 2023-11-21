! Description: Demonstrates the manipulation of color spaces and their conversions.
! This program sets a custom color using various methods, converts it to different color spaces,
! retrieves color values, finds the nearest color, and prints color details.

program demo_color

   use forimage, only: rk, ik, color
   implicit none

   type(color)      :: custom_color, nearest_color
   integer(ik)      :: r, g, b
   character(len=7) :: hex
   integer(ik)      :: decimal
   integer(ik)      :: c, m, y, k
   real(rk)         :: h, s, v
   real(rk)         :: hl, sl, vl
   real(rk)         :: xyz_x, xyz_y, xyz_z


   ! Set the color using RGB values
   call custom_color%set(name='custom_color', r=245_ik, g=127_ik, b=64_ik)

   ! Convert the color to other color spaces
   call custom_color%convert('rgb2all')

   ! Get the values of the color in other color spaces
   call custom_color%get(r=r, g=g, b=b)
   call custom_color%get(hex=hex)
   call custom_color%get(decimal=decimal)
   call custom_color%get(c=c, m=m, y=y, k=k)
   call custom_color%get(h=h, s=s, v=v)
   call custom_color%get(hl=hl, sl=sl, vl=vl)
   call custom_color%get(xyz_x=xyz_x, xyz_y=xyz_y, xyz_z=xyz_z)

   ! Print the name and color values
   call custom_color%print()



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

   ! Print the name and color values
   call custom_color%print()



   ! Set the color using a decimal value
   call custom_color%set(name='custom_color', decimal=16088896)

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

   ! Print the name and color values
   call custom_color%print()



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

   ! Print the name and color values
   call custom_color%print()



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

   ! Print the name and color values
   call custom_color%print()



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

   ! Print the name and color values
   call custom_color%print()



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

   ! Print the name and color values
   call custom_color%print()



   ! Print and save the available colors
   call custom_color%print_available_colors()
   call custom_color%save_available_colors()



   ! Set a color using the name of a color from the available colors
   call custom_color%set('red', use_library=.true.)
   call custom_color%print()



   ! Set the color using specific RGB values
   call custom_color%set(name='custom_color', r=100_ik, g=30_ik, b=30_ik)

   print'(a)', 'Find the nearest color to the custom color'
   call custom_color%find_nearest(nearest_color)

   ! Print the name and values of the nearest color
   call nearest_color%print()

end program demo_color
