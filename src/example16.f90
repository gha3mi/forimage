program example16
    use forimage, only: format_lut
    implicit none
    
    type(format_lut) :: ex16

    call ex16%import(file_name='lut_files/example15',dim_colors=3)
    call ex16%export(file_name='lut_files/example16')
    
    call ex16%finalize()

end program example16
