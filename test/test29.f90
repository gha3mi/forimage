program example29

   use forimage, only: color
   implicit none

   type(color) :: c

   call c%print_available_colors()
   call c%save_available_colors()

end program example29
