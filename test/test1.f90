! Description: Creates and exports a 6x10 PBM image in ascii format.

program test1
    use forimage, only: format_pnm, ik
    implicit none

    ! Declare an object of type format_pnm
    type(format_pnm) :: image

    ! Define a 2D array representing pixel values (0 and 1) for the image
    integer(ik), dimension(10,6) :: px

    print*,' '
    print'(a)', 'Test 1'

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
    call image%set_pnm(encoding='ascii', file_format='pbm', width=6, height=10, comment='test 1', pixels=px)

    ! Export the PNM image to a file named 'img1_ascii' in the specified format
    call image%export_pnm('pnm_files/img1_ascii')

    ! Print the image information to the screen
    call image%print_info()

    ! Finalize the format_pnm object to release resources
    call image%finalize()

end program test1
