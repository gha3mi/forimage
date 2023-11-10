program test15
    use forimage, only: format_lut
    implicit none
    
    type(format_lut) :: ex15
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

    call ex15%set(num_colors=8, dim_colors=3, colors=colors)
    call ex15%export('lut_files/test15')

    call ex15%finalize()

end program test15
