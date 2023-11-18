program example27

   use forimage, only: ik, color
   implicit none

   type(color) :: custom_color, nearest_color

   ! Set the color using RGB values
   call custom_color%set(name='custom_color', r=0_ik, g=0_ik, b=120_ik)

   print'(a)', 'Find the nearest color to the custom color'
   call custom_color%find_nearest(nearest_color)

   call nearest_color%print()

end program example27
