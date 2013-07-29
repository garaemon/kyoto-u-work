program one
  real S
  do i = 5, 50
     S = S + i * (i + 3) / real(i) / i
  end do
  print *, S
end program one
