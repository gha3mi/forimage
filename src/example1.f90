program example1
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex1
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

    call ex1%set_pnm(encoding='ascii', file_format='pbm', width=10, height=6, comment='example 1', pixels=px)
    call ex1%export_pnm('pnm_files/example1')

    call ex1%import_pnm('pnm_files/example1','pbm','ascii')
    call ex1%export_pnm('pnm_files/example1_ex')

    call ex1%dlloc()

end program example1
