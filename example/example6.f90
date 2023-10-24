program example6
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex6
    integer, dimension(4,12) :: px

    px(1,:)  = [0,0,0,0,0,0,0,0,0,15,0,15]
    px(2,:)  = [0,0,0,0,15,7,0,0,0,0,0,0]
    px(3,:)  = [0,0,0,0,0,0,0,15,7,0,0,0]
    px(4,:)  = [15,0,15,0,0,0,0,0,0,0,0,0]

    call ex6%set_pnm(encoding='binary', file_format='ppm', width=4, height=4, max_color=15, comment='example 2', pixels=px)
    call ex6%export_pnm('pnm_files/example6_binary')

    call ex6%dlloc()

end program example6