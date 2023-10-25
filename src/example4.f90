program example4
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex4
    integer, dimension(10,6) :: px

    px(1,:)  = [0,0,0,0,1,0]
    px(2,:)  = [0,0,0,0,1,0]
    px(3,:)  = [0,0,0,0,1,0]
    px(4,:)  = [0,0,0,0,1,0]
    px(5,:)  = [0,0,0,0,1,0]
    px(6,:)  = [0,0,0,0,1,0]
    px(7,:)  = [1,0,0,0,1,0]
    px(8,:)  = [0,1,1,1,0,0]
    px(9,:)  = [0,0,0,0,0,0]
    px(10,:) = [0,0,0,0,0,0]

    call ex4%set_pnm(encoding='binary', file_format='pbm', width=6, height=10, comment='example 1', pixels=px)
    call ex4%export_pnm('pnm_files/example4_binary')

    call ex4%finalize()

end program example4
