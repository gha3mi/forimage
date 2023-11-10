program test16
    use forimage, only: format_lut
    implicit none
    
    type(format_lut) :: ex16

    print*,' '
    print'(a)', 'Test 16'

    call ex16%import(file_name='lut_files/test15',dim_colors=3)
    call ex16%export(file_name='lut_files/test16')
    
    call ex16%finalize()

end program test16
