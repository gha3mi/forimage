program test13
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex13

    print*,' '
    print'(a)', 'Test 13'

    call ex13%import_pnm('pnm_files/img3_binary','ppm','binary')

    ! Print the image information to the screen
    call ex13%print_info()

    call ex13%export_pnm('pnm_files/img3_binary_to_ascii_ex','ascii')

    call ex13%finalize()

end program test13
