module forimage_parameters
    use iso_fortran_env, only: rk=>real64, ik=>int32
    implicit none
    private
    public :: rk, ik, pi

    real(rk), parameter :: pi = 4.0_rk * atan(1.0_rk)
end module forimage_parameters