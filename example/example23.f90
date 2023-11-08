program example23
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex23
    integer, dimension(4,12) :: px

    px(1,:)  = [4,5,7,0,0,0,0,0,0,15,0,15]
    px(2,:)  = [0,0,8,1,13,7,0,0,0,0,0,0]
    px(3,:)  = [0,0,4,0,0,0,0,15,7,0,0,0]
    px(4,:)  = [15,0,15,0,0,0,0,0,0,0,0,0]

    call ex23%set_pnm(encoding='binary', file_format='ppm', width=4, height=4, max_color=15, comment='example 2', pixels=px)
    call ex23%flip_horizontal()
    call ex23%export_pnm('pnm_files/example6_binary_flip_horizontal')
    call ex23%finalize()

    call ex23%set_pnm(encoding='binary', file_format='ppm', width=4, height=4, max_color=15, comment='example 2', pixels=px)
    call ex23%flip_vertical()
    call ex23%export_pnm('pnm_files/example6_binary_flip_vertical')
    call ex23%finalize()
end program example23
