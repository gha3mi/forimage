program test14
    use forimage, only: format_pnm
    implicit none

    type(format_pnm) :: image

    print*,' '
    print'(a)', 'Test 14'

    call image%import_pnm('pnm_files/img3_ascii','ppm','ascii')

    ! Print the image information to the screen
    call image%print_info()

    call image%export_pnm('pnm_files/img3_ascii_to_binary_ex','binary')

    call image%finalize()

end program test14
