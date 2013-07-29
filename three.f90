program three
  real x_start, x_end, h, x, y, y_next, k1, k2, k3, k4
  integer step_num
  x_start = 5.0
  x_end = 7.0
  step_num = 100
  h = (x_end - x_start) / step_num

  ! 初期値
  y = 3.5
  print '(f0.2," ",f0.2)', x_start, y
  do i = 0, step_num
     x = x_start + h * i
     k1 = f(x, y)
     k2 = f(x + h / 2.0, y + h / 2.0 * k1)
     k3 = f(x + h / 2.0, y + h / 2.0 * k2)
     k4 = f(x + h, y + h * k3)
     y_next = y_n_plus_1(y, h, k1, k2, k3, k4)
     print '(f0.2," ",f0.2)', x + h, y_next
     y = y_next
  end do
  
end program three

real function f (x, y)
  real x, y
  f = y + 2 * x - sin(3 * x)
end function f

real function y_n_plus_1 (y_n, h, k1, k2, k3, k4)
  real y_n, h, k1, k2, k3, k4
  y_n_plus_1 = y_n + (k1 + 2 * k2 + 2 * k3 + k4) * h / 6.0
end function y_n_plus_1

