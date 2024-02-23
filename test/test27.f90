program example27

   use forimage, only: ik, color
   implicit none

   type(color) :: custom_color, nearest_color

   call custom_color%set(name='custom_color', decimal=16711680_ik)

   print'(a)', 'Find the nearest color to the custom color'
   call custom_color%convert('decimal2rgb')
   call custom_color%find_nearest(nearest_color)

   call nearest_color%print()

end program example27
