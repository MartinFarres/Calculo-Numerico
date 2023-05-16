
function metodoNewton()
  xData = [3; 7; 9];
  y = [5; -1; 2];

  [interpolate] = intFunction(xData, y);

  succes = true;
  for i = 1 : rows(xData)
    if interpolate(xData(i)) != y(i)
      succes = false;
    endif
  endfor

  succes
endfunction

function [interpolate] = intFunction(xData, y)
  n = rows(xData);
  O = zeros(n, n);

  for column = 1 : n
    newtonPol = getNewton(column, xData);
    for row = 1 : n
      O(row, column) = newtonPol(xData(row));
    endfor
  endfor

  coeffs = O\y;

  interpolate = @(x)(0);
  for i = 1 : n
    coeff = coeffs(i);
    newtonPol = getNewton(i, xData);
    interpolate = @(x)(interpolate(x) + coeff * newtonPol(x));
  endfor

endfunction

function [newtonPol] = getNewton(xi, xData)
  newtonPol = @(x)(1);

  for i = 2 : xi
    newtonPol = @(x)(newtonPol(x) * (x - xData(i - 1)));
  endfor

endfunction


