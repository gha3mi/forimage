program test8
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex8

    print*,' '
    print'(a)', 'Test 8'

    call ex8%import_pnm('pnm_files/img2_ascii','pgm','ascii')

    ! Print the image information to the screen
    call ex8%print_info()

    call ex8%export_pnm('pnm_files/img2_ascii_ex')

    call ex8%finalize()

end program test8
