program example11
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex11

    call ex11%import_pnm('pnm_files/img5_binary','pgm','binary')
    call ex11%export_pnm('pnm_files/img5_binary_ex')

    call ex11%finalize()

end program example11
