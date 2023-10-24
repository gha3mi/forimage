program example8
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex8

    call ex8%import_pnm('pnm_files/example2_ascii','pgm','ascii')
    call ex8%export_pnm('pnm_files/example2_ascii_ex')

    call ex8%dlloc()

end program example8
