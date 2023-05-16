function metodoDeLagrange()
  x_data = [3; 7; 9];
  y = [5; -1; 2];

  [interpolate] = intFunction(x_data, y);

  succes = true;

  for i = 1 : rows(y)
    if interpolate(x_data(i)) != y(i)
      success = false;
      break
    endif
  endfor

  succes
endfunction

function [interpolate] = intFunction(x_data, y)
  n = length(y);
  interpolate = @(x)(0);

  for i = 1 : n
    coeff = y(i);
    lagrangePol = getLagrange(i, x_data);
    interpolate = @(x)(interpolate(x) + (coeff * lagrangePol(x)));
  endfor
endfunction

function [lagrange] = getLagrange(i, x_data)
  lagrange = @(x)(1);

  for index = 1 : length(x_data)

    if index == i
      continue
    endif

    lagrange = @(x)(lagrange(x) * (x - x_data(i)) / (x_data(index) - x_data(i)));

  endfor
endfunction





