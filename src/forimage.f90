module forimage

   use forimage_parameters, only: rk, ik, pi
   use forcolor, only: color
   use pnm, only: format_pnm
   use lut, only: format_lut

   implicit none

   private
   public format_pnm, format_lut, rk, ik, pi, color

end module forimage
