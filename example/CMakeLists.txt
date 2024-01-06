# DEMO_COLOR.F90
add_executable(demo_color demo_color.f90)
target_link_libraries(demo_color ${PROJECT_NAME})

# DEMO_PPM.F90
add_executable(demo_ppm demo_ppm.f90)
target_link_libraries(demo_ppm ${PROJECT_NAME})
