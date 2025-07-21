program test15
    use forimage, only: format_lut
    implicit none

    type(format_lut) :: image
    integer, dimension(1:8, 3) :: colors = reshape( [ &
          0,     0,     0,   &
        255,     0,     0,   &
          0,   255,     0,   &
          0,     0,   255,   &
        255,   255,     0,   &
          0,   255,   255,   &
        255,     0,   255,   &
        255,   255,   255 ], &
        shape(colors), order = [2, 1] )

    print*,' '
    print'(a)', 'Test 15'

    call image%set(num_colors=8, dim_colors=3, colors=colors)
    call image%export('lut_files/test15')

    call image%finalize()

end program test15
