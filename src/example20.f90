program example20
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex20
    integer, dimension(4,12) :: px

    px(1,:)  = [0,0,0,0,0,0,0,0,0,15,0,15]
    px(2,:)  = [0,0,0,0,15,7,0,0,0,0,0,0]
    px(3,:)  = [0,0,0,0,0,0,0,15,7,0,0,0]
    px(4,:)  = [15,0,15,0,0,0,0,0,0,0,0,0]

    call ex20%set_pnm(encoding='binary', file_format='ppm', width=4, height=4, max_color=15, comment='example 2', pixels=px)
    call ex20%remove_channel(remove_r=.true., remove_b=.true.)
    call ex20%export_pnm('pnm_files/example6_binary_remove')

    call ex20%finalize()
end program example20
