module forimage_parameters
    use iso_fortran_env, only: rk=>real64
    implicit none
    private
    public :: rk, pi

    real(rk), parameter :: pi = 4.0_rk * atan(1.0_rk)
end module forimage_parameters