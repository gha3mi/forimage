program example26

   use forimage, only: rk, ik, color
   implicit none

   type(color)      :: custom_color
   integer(ik)      :: r, g, b
   character(len=7) :: hex
   integer(ik)      :: decimal
   integer(ik)      :: c, m, y, k
   real(rk)         :: h, s, v
   real(rk)         :: hl, sl, vl



   print*, ''
   ! Set the color using RGB values
   call custom_color%set_rgb(245_ik, 127_ik, 64_ik)

   ! Convert the color to other color spaces
   call custom_color%convert('rgb2hex')
   call custom_color%convert('rgb2decimal')
   call custom_color%convert('rgb2cmyk')
   call custom_color%convert('rgb2hsv')
   call custom_color%convert('rgb2hsl')

   ! Get the values of the color in other color spaces
   call custom_color%get_rgb(r, g, b)
   call custom_color%get_hex(hex)
   call custom_color%get_decimal(decimal)
   call custom_color%get_cmyk(c, m, y, k)
   call custom_color%get_hsv(h, s, v)
   call custom_color%get_hsl(hl, sl, vl)

   ! Print the values of the color in other color spaces
   call custom_color%print_rgb()
   call custom_color%print_hex()
   call custom_color%print_decimal()
   call custom_color%print_cmyk()
   call custom_color%print_hsv()
   call custom_color%print_hsl()



   print*, ''
   ! Set the color using a hex value
   call custom_color%set_hex('#F57F40')

   ! Convert the color to other color spaces
   call custom_color%convert('hex2rgb')
   call custom_color%convert('hex2decimal')
   call custom_color%convert('hex2cmyk')
   call custom_color%convert('hex2hsv')
   call custom_color%convert('hex2hsl')

   ! Get the values of the color in other color spaces
   call custom_color%get_rgb(r, g, b)
   call custom_color%get_hex(hex)
   call custom_color%get_decimal(decimal)
   call custom_color%get_cmyk(c, m, y, k)
   call custom_color%get_hsv(h, s, v)
   call custom_color%get_hsl(hl, sl, vl)

   ! Print the values of the color in other color spaces
   call custom_color%print_rgb()
   call custom_color%print_hex()
   call custom_color%print_decimal()
   call custom_color%print_cmyk()
   call custom_color%print_hsv()
   call custom_color%print_hsl()



   print*, ''
   ! Set the color using a decimal value
   call custom_color%set_decimal(16088896)

   ! Convert the color to other color spaces
   call custom_color%convert('decimal2rgb')
   call custom_color%convert('decimal2hex')
   call custom_color%convert('decimal2cmyk')
   call custom_color%convert('decimal2hsv')
   call custom_color%convert('decimal2hsl')

   ! Get the values of the color in other color spaces
   call custom_color%get_rgb(r, g, b)
   call custom_color%get_hex(hex)
   call custom_color%get_decimal(decimal)
   call custom_color%get_cmyk(c, m, y, k)
   call custom_color%get_hsv(h, s, v)
   call custom_color%get_hsl(hl, sl, vl)

   ! Print the values of the color in other color spaces
   call custom_color%print_rgb()
   call custom_color%print_hex()
   call custom_color%print_decimal()
   call custom_color%print_cmyk()
   call custom_color%print_hsv()
   call custom_color%print_hsl()



   print*, ''
   ! Set the color using a decimal value
   call custom_color%set_cmyk(0_ik, 48_ik, 74_ik, 4_ik)

   ! Convert the color to other color spaces
   call custom_color%convert('cmyk2rgb')
   call custom_color%convert('cmyk2hex')
   call custom_color%convert('cmyk2decimal')
   call custom_color%convert('cmyk2hsv')
   call custom_color%convert('cmyk2hsl')

   ! Get the values of the color in other color spaces
   call custom_color%get_rgb(r, g, b)
   call custom_color%get_hex(hex)
   call custom_color%get_decimal(decimal)
   call custom_color%get_cmyk(c, m, y, k)
   call custom_color%get_hsv(h, s, v)
   call custom_color%get_hsl(hl, sl, vl)

   ! Print the values of the color in other color spaces
   call custom_color%print_rgb()
   call custom_color%print_hex()
   call custom_color%print_decimal()
   call custom_color%print_cmyk()
   call custom_color%print_hsv()
   call custom_color%print_hsl()



   print*, ''
   ! Set the color using a hsv value
   call custom_color%set_hsv(20.8840_rk, 73.8776_rk, 96.0784_rk)

   ! Convert the color to other color spaces
   call custom_color%convert('hsv2rgb')
   call custom_color%convert('hsv2hex')
   call custom_color%convert('hsv2cmyk')
   call custom_color%convert('hsv2decimal')
   call custom_color%convert('hsv2hsl')

   ! Get the values of the color in other color spaces
   call custom_color%get_rgb(r, g, b)
   call custom_color%get_hex(hex)
   call custom_color%get_decimal(decimal)
   call custom_color%get_cmyk(c, m, y, k)
   call custom_color%get_hsv(h, s, v)
   call custom_color%get_hsl(hl, sl, vl)

   ! Print the values of the color in other color spaces
   call custom_color%print_rgb()
   call custom_color%print_hex()
   call custom_color%print_decimal()
   call custom_color%print_cmyk()
   call custom_color%print_hsv()
   call custom_color%print_hsl()



   print*, ''
   ! Set the color using a hsv value
   call custom_color%set_hsl(20.8840_rk, 90.0498_rk, 60.5882_rk)

   ! Convert the color to other color spaces
   call custom_color%convert('hsl2rgb')
   call custom_color%convert('hsl2hex')
   call custom_color%convert('hsl2cmyk')
   call custom_color%convert('hsl2decimal')
   call custom_color%convert('hsl2hsv')

   ! Get the values of the color in other color spaces
   call custom_color%get_rgb(r, g, b)
   call custom_color%get_hex(hex)
   call custom_color%get_decimal(decimal)
   call custom_color%get_cmyk(c, m, y, k)
   call custom_color%get_hsv(h, s, v)
   call custom_color%get_hsl(hl, sl, vl)

   ! Print the values of the color in other color spaces
   call custom_color%print_rgb()
   call custom_color%print_hex()
   call custom_color%print_decimal()
   call custom_color%print_cmyk()
   call custom_color%print_hsv()
   call custom_color%print_hsl()

end program example26
