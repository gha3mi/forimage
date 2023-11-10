program test20
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) :: ex20
    integer, dimension(4,12) :: px

    print*,' '
    print'(a)', 'Test 20'

    px(1,:)  = [0,0,0,0,0,0,0,0,0,15,0,15]
    px(2,:)  = [0,0,0,0,15,7,0,0,0,0,0,0]
    px(3,:)  = [0,0,0,0,0,0,0,15,7,0,0,0]
    px(4,:)  = [15,0,15,0,0,0,0,0,0,0,0,0]

    call ex20%set_pnm(encoding='binary', file_format='ppm', width=4, height=4, max_color=15, comment='test 2', pixels=px)
    call ex20%remove_channels(remove_r=.true., remove_b=.true.)
    call ex20%export_pnm('pnm_files/img3_binary_remove')
    call ex20%print_info()
    call ex20%finalize()
end program test20
