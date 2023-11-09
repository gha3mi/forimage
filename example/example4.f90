! Description: Creates and exports a 6x10 PBM image in binary format.

program example4
    use forimage, only: format_pnm
    implicit none
    
    ! Declare an object of type format_pnm
    type(format_pnm) :: ex4

    ! Define a 2D array representing pixel values (0 and 1) for the image
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

    ! Set the properties of the format_pnm object (encoding, file format, width, height, comment and pixels)
    call ex4%set_pnm(encoding='binary', file_format='pbm', width=6, height=10, comment='example 1', pixels=px)

    ! Export the PNM image to a file named 'img4_binary' in the specified format
    call ex4%export_pnm('pnm_files/img4_binary')

    ! Finalize the format_pnm object to release resources
    call ex4%finalize()

end program example4
