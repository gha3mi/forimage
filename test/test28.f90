program example28

   use forimage, only: color
   implicit none

   type(color) :: c

   call c%set('red', use_library=.true.)
   call c%print()

end program example28
