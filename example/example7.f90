program example7
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex7

    call ex7%import_pnm('pnm_files/example1_ascii','pbm','ascii')
    call ex7%export_pnm('pnm_files/example1_ascii_ex')

    call ex7%finalize()

end program example7
