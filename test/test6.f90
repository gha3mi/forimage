! Description: Creates and exports a 4X4 PPM image in binary format.

program test6
    use forimage, only: format_pnm, ik
    implicit none

    ! Declare an object of type format_pnm
    type(format_pnm) :: image

    ! Define a 2D array representing pixel values (0 and 1) for the image
    integer(ik), dimension(4,12) :: px

    print*,' '
    print'(a)', 'Test 6'

    px(1,:)  = [14,12,11,0,0,0,0,0,0,15,0,15]
    px(2,:)  = [0,0,0,0,15,7,0,0,0,0,0,0]
    px(3,:)  = [0,0,0,0,0,0,0,15,7,0,0,0]
    px(4,:)  = [15,0,15,0,0,0,0,0,0,0,0,0]

    ! Set the properties of the format_pnm object (encoding, file format, width, height, comment and pixels)
    call image%set_pnm(encoding='binary', file_format='ppm', width=4, height=4, max_color=15, comment='test 2', pixels=px)

    ! Export the PNM image to a file named 'img3_binary' in the specified format
    call image%export_pnm('pnm_files/img3_binary')

    ! Print the image information to the screen
    call image%print_info()

    ! Finalize the format_pnm object to release resources
    call image%finalize()

end program test6
