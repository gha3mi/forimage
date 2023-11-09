program example13
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex13

    call ex13%import_pnm('pnm_files/img6_binary','ppm','binary')
    call ex13%export_pnm('pnm_files/img6_binary_to_ascii_ex','ascii')

    call ex13%finalize()

end program example13
