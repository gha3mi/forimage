module lut

   implicit none

   private
   public format_lut

   !===============================================================================
   type format_lut
      integer                              :: num_colors
      integer                              :: dim_colors
      integer, dimension(:,:), allocatable :: colors
   contains
      procedure :: allocate_colors
      procedure :: set
      procedure :: set_num_colors
      procedure :: get_num_colors
      procedure :: set_dim_colors
      procedure :: get_dim_colors
      procedure :: set_colors
      procedure :: get_colors
      procedure :: export
      procedure :: import
      procedure :: finalize => deallocate_lut
   end type format_lut
   !===============================================================================

contains

   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure elemental subroutine allocate_colors(this)
      class(format_lut), intent(inout) :: this
      if (allocated(this%colors)) deallocate(this%colors)
      allocate(this%colors(this%num_colors, this%dim_colors))
   end subroutine allocate_colors
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure subroutine set(this, num_colors, dim_colors, colors)
      class(format_lut),       intent(inout) :: this
      integer,                 intent(in)    :: num_colors, dim_colors
      integer, dimension(:,:), intent(in)    :: colors

      this%num_colors = num_colors
      this%dim_colors = dim_colors
      call this%allocate_colors()
      this%colors = colors
   end subroutine set
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure elemental subroutine set_num_colors(this, num_colors)
      class(format_lut), intent(inout) :: this
      integer,           intent(in)    :: num_colors
      this%num_colors = num_colors
   end subroutine set_num_colors
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure elemental subroutine set_dim_colors(this, dim_colors)
      class(format_lut), intent(inout) :: this
      integer,           intent(in)    :: dim_colors
      this%dim_colors = dim_colors
   end subroutine set_dim_colors
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure elemental function get_num_colors(this) result(num_colors)
      class(format_lut), intent(in) :: this
      integer :: num_colors
      num_colors = this%num_colors
   end function get_num_colors
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure elemental function get_dim_colors(this) result(dim_colors)
      class(format_lut), intent(in) :: this
      integer :: dim_colors
      dim_colors = this%dim_colors
   end function get_dim_colors
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure subroutine set_colors(this, colors)
      class(format_lut),       intent(inout) :: this
      integer, dimension(:,:), intent(in)    :: colors
      this%colors = colors
   end subroutine set_colors
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure function get_colors(this) result(colors)
      class(format_lut), intent(in)        :: this
      integer, dimension(:,:), allocatable :: colors
      colors = this%colors
   end function get_colors
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   pure elemental subroutine deallocate_lut(this)
      class(format_lut), intent(inout) :: this
      if (allocated(this%colors)) deallocate(this%colors)
   end subroutine deallocate_lut
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   impure subroutine import(this, file_name, dim_colors)
      class(format_lut), intent(inout) :: this
      character(*),      intent(in)    :: file_name
      integer,           intent(in)    :: dim_colors
      integer, dimension(1,dim_colors) :: temp
      integer                          :: nunit, iostat, num_rows, i
      logical :: file_exists
      integer, dimension(dim_colors) :: buffer

      inquire(file=file_name//'.lut', exist=file_exists)
      if (file_exists) then
      open(newunit=nunit, file=file_name//'.lut', status='old', action='read', iostat=iostat)
      if (iostat /= 0) error stop 'Error opening the file.'
         num_rows = 0
         do
            read(nunit, *, iostat=iostat) temp(:,:)
            if (iostat /= 0) exit
            num_rows = num_rows + 1
         end do
         call this%set_num_colors(num_rows)
         call this%set_dim_colors(dim_colors)
         call this%allocate_colors()
         rewind(nunit)
         do i = 1, num_rows
            read(nunit, *) buffer
            this%colors(i,:) = buffer
         end do
      close(nunit)
      else
         error stop 'File '//file_name//'.lut'//' does not exist!'
      end if
   end subroutine import
   !===============================================================================


   !===============================================================================
   !> author: Seyed Ali Ghasemi
   impure subroutine export(this, file_name)
      class(format_lut), intent(inout)    :: this
      character(*),      intent(in)       :: file_name
      integer                             :: nunit, i
      integer, dimension(this%dim_colors) :: buffer
      integer                             :: iostat

      open(newunit=nunit, file=file_name//'.lut', status='replace', action='write', iostat=iostat)
      if (iostat /= 0) error stop 'Error opening the file.'
      do i = 1, this%get_num_colors()
         buffer = this%colors(i,:)
         write(nunit, '(*(I3,1x))') buffer
      end do
      close(nunit)
   end subroutine export
   !===============================================================================

end module lut
