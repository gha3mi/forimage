program example24
    use forimage, only: format_pnm
    implicit none
    
    type(format_pnm) ::  ex24_1, ex24_2, ex24_3
    integer, dimension(10,6) :: px1
    integer, dimension(60,60) :: px2
    integer, dimension(4,12) :: px3

    px1(1,:)  = [0,0,0,0,1,0]
    px1(2,:)  = [0,0,0,0,1,0]
    px1(3,:)  = [0,0,0,0,1,0]
    px1(4,:)  = [0,0,0,0,1,0]
    px1(5,:)  = [0,0,0,0,1,0]
    px1(6,:)  = [0,0,0,0,1,0]
    px1(7,:)  = [1,0,0,0,1,0]
    px1(8,:)  = [0,1,1,1,0,0]
    px1(9,:)  = [0,0,0,0,0,0]
    px1(10,:) = [0,0,0,0,0,0]

    call ex24_1%set_pnm(encoding='binary', file_format='pbm', width=6, height=10, comment='example 1', pixels=px1)
    call ex24_1%crop(2,10, 3,6)
    call ex24_1%export_pnm('pnm_files/img1_binary_crop')

    call ex24_1%finalize()






    
    px2 = transpose(reshape(&
    [255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    251,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    251,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    251,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    251,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    251,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    237,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    237,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    237,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    237,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    0,&
    237,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    242,&
    0,&
    0,&
    0,&
    0,&
    0,&
    119,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255,&
    255]&
    ,shape=shape(px2)))

    call ex24_2%set_pnm(encoding='binary', file_format='pgm', width=60, height=60, max_color=255, comment='example 2', pixels=px2)
    call ex24_2%crop(2,50, 3,55)
    call ex24_2%export_pnm('pnm_files/img2_binary_crop')

    call ex24_2%finalize()








    px3(1,:)  = [0,0,0,0,0,0,0,0,0,15,0,15]
    px3(2,:)  = [0,0,0,0,15,7,0,0,0,0,0,0]
    px3(3,:)  = [0,0,0,0,0,0,0,15,7,0,0,0]
    px3(4,:)  = [15,0,15,0,0,0,0,0,0,0,0,0]

    call ex24_3%set_pnm(encoding='binary', file_format='ppm', width=4, height=4, max_color=15, comment='example 2', pixels=px3)
    call ex24_3%crop(1,3, 2,4)
    call ex24_3%export_pnm('pnm_files/img6_binary_crop')

    call ex24_3%finalize()
end program example24