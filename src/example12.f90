program example12
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex12

    call ex12%import_pnm('pnm_files/example6_binary','ppm','binary')
    call ex12%export_pnm('pnm_files/example6_binary_ex')

    call ex12%dlloc()

end program example12
