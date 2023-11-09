! Description: Creates and exports a 4X4 PPM image in binary format.

program example6
    use forimage, only: format_pnm
    implicit none
    
    ! Declare an object of type format_pnm
    type(format_pnm) :: ex6

    ! Define a 2D array representing pixel values (0 and 1) for the image
    integer, dimension(4,12) :: px
    px(1,:)  = [0,0,0,0,0,0,0,0,0,15,0,15]
    px(2,:)  = [0,0,0,0,15,7,0,0,0,0,0,0]
    px(3,:)  = [0,0,0,0,0,0,0,15,7,0,0,0]
    px(4,:)  = [15,0,15,0,0,0,0,0,0,0,0,0]

    ! Set the properties of the format_pnm object (encoding, file format, width, height, comment and pixels)
    call ex6%set_pnm(encoding='binary', file_format='ppm', width=4, height=4, max_color=15, comment='example 2', pixels=px)

    ! Export the PNM image to a file named 'img6_binary' in the specified format
    call ex6%export_pnm('pnm_files/img6_binary')

    ! Finalize the format_pnm object to release resources
    call ex6%finalize()

end program example6
