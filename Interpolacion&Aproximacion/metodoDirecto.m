function metodoDirecto()
  x = [3; 7; 9];
  y = [5; -1; 2];

  [interpolate] = intFunction(x, y);

  succes = true;

  for i = 1 : rows(x)
    if interpolate(x(i)) != y(i)
      succes = false;
      break
    endif
  endfor

  succes
endfunction

function [interpolate] = intFunction(x, y)
  n = rows(x);
  O = zeros(n, n);

  for row = 1 : n
    for column = 1 : n
      O(row, column) = power(x(row), column - 1);
    endfor
  endfor

  coeffs = O\y
  interpolate = @(x)(0);
  for i = 1 : n
    coeff = coeffs(i);
    interpolate = @(x) (interpolate(x) + coeff * power(x, i -1));
  endfor

endfunction
