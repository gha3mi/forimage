program test10
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex10

    print*,' '
    print'(a)', 'Test 10'

    call ex10%import_pnm('pnm_files/img1_binary','pbm','binary')

    ! Print the image information to the screen
    call ex10%print_info()

    call ex10%export_pnm('pnm_files/img1_binary_ex')

    call ex10%finalize()

end program test10
