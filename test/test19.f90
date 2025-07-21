program test19
    use forimage, only: format_pnm, ik
    implicit none

    type(format_pnm) :: image
    integer(ik), dimension(4,12) :: px

    print*,' '
    print'(a)', 'Test 19'

    px(1,:)  = [14,12,11,0,0,0,0,0,0,15,0,15]
    px(2,:)  = [0,0,0,0,15,7,0,0,0,0,0,0]
    px(3,:)  = [0,0,0,0,0,0,0,15,7,0,0,0]
    px(4,:)  = [15,0,15,0,0,0,0,0,0,0,0,0]

    call image%set_pnm(encoding='binary', file_format='ppm', width=4, height=4, max_color=15, comment='test 2', pixels=px)
    call image%swap_channels(swap='bg')
    call image%export_pnm('pnm_files/img3_binary_swap')
    call image%export_pnm('pnm_files/img3_ascii_swap', 'ascii')
    call image%print_info()
    call image%finalize()
end program test19
