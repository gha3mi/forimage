! Description: Creates and exports a 4x4 PPM image in ascii format.

program example3
    use forimage, only: format_pnm
    implicit none
    
    ! Declare an object of type format_pnm
    type(format_pnm) :: ex3

    ! Define a 2D array representing pixel values for the image
    integer, dimension(4,12) :: px
    px(1,:)  = [0,0,0,0,0,0,0,0,0,15,0,15]
    px(2,:)  = [0,0,0,0,15,7,0,0,0,0,0,0]
    px(3,:)  = [0,0,0,0,0,0,0,15,7,0,0,0]
    px(4,:)  = [15,0,15,0,0,0,0,0,0,0,0,0]

    ! Set the properties of the format_pnm object (encoding, file format, width, height, comment and pixels)
    call ex3%set_pnm(encoding='ascii', file_format='ppm', width=4, height=4, max_color=15, comment='example 2', pixels=px)

    ! Export the PNM image to a file named 'img3_ascii' in the specified format
    call ex3%export_pnm('pnm_files/img3_ascii')

    ! Finalize the format_pnm object to release resources
    call ex3%finalize()

end program example3
