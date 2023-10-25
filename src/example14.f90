program example14
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex14

    call ex14%import_pnm('pnm_files/example3_ascii','ppm','ascii')
    call ex14%export_pnm('pnm_files/example6_ascii_to_binary_ex','binary')

    call ex14%finalize()

end program example14
