program example10
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex10

    call ex10%import_pnm('pnm_files/example4_binary','pbm','binary')
    call ex10%export_pnm('pnm_files/example4_binary_ex')

    call ex10%dlloc()

end program example10
