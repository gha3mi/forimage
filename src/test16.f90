program test16
    use forimage, only: format_lut
    implicit none

    type(format_lut) :: image

    print*,' '
    print'(a)', 'Test 16'

    call image%import(file_name='lut_files/test15',dim_colors=3)
    call image%export(file_name='lut_files/test16')

    call image%finalize()

end program test16
