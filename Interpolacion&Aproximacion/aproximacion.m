function aproximacion()
  xData = [0;1;2;3;4;5;6];
  y = [4; 7; 9; 10; 9; 12; 15];
  functions = {
    @(x)(1),
    @(x)(x),
    @(x)(power(x, 2))
  };
  [aprox] = aproxFunc(functions, xData, y);


  for i = 1 : rows(xData)
    aprox(xData(i))
  endfor


endfunction

function [aprox] = aproxFunc(functions, xData, y)
  n = length(functions);
  O = zeros(rows(xData), n);

  for column = 1 : n
    currentFunc = functions{column};
    for row = 1 : rows(xData)
      O(row, column) = currentFunc(xData(row));
    endfor
  endfor

  A = transpose(O) * O;
  b = transpose(O) * y;
  coeffs = A\b

  aprox = @(x)(0);
  for i = 1 : n
    coeff = coeffs(i);
    aprox = @(x)(aprox(x) + coeff * functions{i}(x));
  endfor


endfunction
