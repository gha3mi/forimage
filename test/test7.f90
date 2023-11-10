program test7
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex7

    print*,' '
    print'(a)', 'Test 7'

    call ex7%import_pnm('pnm_files/img1_ascii','pbm','ascii')

    ! Print the image information to the screen
    call ex7%print_info()

    call ex7%export_pnm('pnm_files/img1_ascii_ex')

    call ex7%finalize()

end program test7
