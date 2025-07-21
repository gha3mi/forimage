program test8
    use forimage, only: format_pnm
    implicit none

    type(format_pnm) :: image

    print*,' '
    print'(a)', 'Test 8'

    call image%import_pnm('pnm_files/img2_ascii','pgm','ascii')

    ! Print the image information to the screen
    call image%print_info()

    call image%export_pnm('pnm_files/img2_ascii_ex')

    call image%finalize()

end program test8
