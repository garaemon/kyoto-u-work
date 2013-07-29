program two
  ! Ax = b
  real A(3, 3), A_inv(3, 3), b(3), r(3)
  data A/2,0,1,5,3,3,7,2,2/
  data b/-12,9,8/
  ! data A/1,2,1,2,1,1,1,0,2/
  call matrix_inv(A, A_inv)
  print *, "input matrix:"
  call print_3x3(A)
  print *, "inverse matrix:"
  call print_3x3(A_inv)
  call matrix_vector_multiply(A_inv, b, r)
  print *, "result is"
  print *, r(1), r(2), r(3)
end program two

subroutine matrix_vector_multiply(M, v, r)
  real v(3), r(3), M(3, 3), tmp
  do i = 1, 3
     tmp = 0
     tmp = tmp + M(i, 1) * v(1)
     tmp = tmp + M(i, 2) * v(2)
     tmp = tmp + M(i, 3) * v(3)
     r(i) = tmp
  end do
end subroutine matrix_vector_multiply

subroutine print_3x6(M)
  real M(3, 6)
  do i = 1, 3
     print *, M(i, 1), M(i, 2), M(i, 3), M(i, 4), M(i, 5), M(i, 6)
  end do
end subroutine print_3x6

subroutine print_3x3(M)
  real M(3, 3)
  do i = 1, 3
     print *, M(i, 1), M(i, 2), M(i, 3)
  end do
end subroutine print_3x3

subroutine matrix_inv(A, A_inv)
  real A(3, 3), A_inv(3, 3)
  real scale_factor
  real row_scale_factor
  ! 3x3のみサポート
  real tmp(3, 6)
  ! 左の行列にAを代入
  do i = 1, 3
     do j = 1, 3
        tmp(i, j) = A(i, j)
     end do
  end do
  ! 右の行列に単位行列
  do i = 1, 3
     tmp(i, 4) = 0.0
     tmp(i, 5) = 0.0
     tmp(i, 6) = 0.0
  end do
  tmp(1, 4) = 1.0
  tmp(2, 5) = 1.0
  tmp(3, 6) = 1.0

  do i = 1, 3
     scale_factor = tmp(i, i)
     do j = 1, 6                !まず割る
        tmp(i, j) = tmp(i, j) / scale_factor
     end do
     do j = 1, 3                !他の行の引き算
        if (j /= i) then
           row_scale_factor = tmp(j, i)
           do k = 1, 6
              tmp(j, k) = tmp(j, k) - tmp(i, k) * row_scale_factor
           end do
        end if
     end do
  end do
  do i = 1, 3
     do j = 1, 3
        A_inv(i, j) = tmp(i, j + 3)
     end do
  end do
end subroutine matrix_inv
