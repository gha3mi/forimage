program test9
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex9

    print*,' '
    print'(a)', 'Test 9'

    call ex9%import_pnm('pnm_files/img3_ascii','ppm','ascii')

    ! Print the image information to the screen
    call ex9%print_info()

    call ex9%export_pnm('pnm_files/img3_ascii_ex')

    call ex9%finalize()

end program test9
