program test11
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex11

    print*,' '
    print'(a)', 'Test 11'

    call ex11%import_pnm('pnm_files/img2_binary','pgm','binary')

    ! Print the image information to the screen
    call ex11%print_info()

    call ex11%export_pnm('pnm_files/img2_binary_ex')

    call ex11%finalize()

end program test11
