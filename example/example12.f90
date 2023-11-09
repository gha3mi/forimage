program example12
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex12

    call ex12%import_pnm('pnm_files/img6_binary','ppm','binary')
    call ex12%export_pnm('pnm_files/img6_binary_ex')

    call ex12%finalize()

end program example12
