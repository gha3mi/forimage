program example9
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex9

    call ex9%import_pnm('pnm_files/example3_ascii','ppm','ascii')
    call ex9%export_pnm('pnm_files/example3_ascii_ex')

    call ex9%finalize()

end program example9
