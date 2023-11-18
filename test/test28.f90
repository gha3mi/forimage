program example28

   use forimage, only: color
   implicit none

   type(color) :: c

   call c%pick('red')
   call c%print()

end program example28
