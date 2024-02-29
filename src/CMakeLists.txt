set(dir ${CMAKE_CURRENT_SOURCE_DIR})

set(FORIMAGE_SOURCES
    ${dir}/forimage_parameters.f90
    ${dir}/forcolor.f90
    ${dir}/forimage.f90
    ${dir}/lut.f90
    ${dir}/pnm.f90
)
set(FORIMAGE_SOURCES ${FORIMAGE_SOURCES} PARENT_SCOPE)