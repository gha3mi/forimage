program test10
    use forimage, only: format_pnm
    implicit none

    type(format_pnm) :: image

    print*,' '
    print'(a)', 'Test 10'

    call image%import_pnm('pnm_files/img1_binary','pbm','binary')

    ! Print the image information to the screen
    call image%print_info()

    call image%export_pnm('pnm_files/img1_binary_ex')

    call image%finalize()

end program test10
