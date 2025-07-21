program test11
    use forimage, only: format_pnm
    implicit none

    type(format_pnm) :: image

    print*,' '
    print'(a)', 'Test 11'

    call image%import_pnm('pnm_files/img2_binary','pgm','binary')

    ! Print the image information to the screen
    call image%print_info()

    call image%export_pnm('pnm_files/img2_binary_ex')

    call image%finalize()

end program test11
