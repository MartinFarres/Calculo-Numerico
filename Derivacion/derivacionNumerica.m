function derivacionNumerica()
  f = @(x)(cos(x*pi));
  a = 0.0;
  b = 1.0;
  h = 0.1;
  xData = a : h : b;

  [derivate1] = getFirtsDer(f, xData, 1)
  [derivate2] = getSecondDer(f, xData, 1)
endfunction

function [derivate1] = getFirtsDer(f, xData, i)
  h = xData(2) - xData(1);

  derivate1 = 0;

  if i == 1
    derivate1 = (1 / (2 * h)) * (-3*f(xData(i)) + 4*f(xData(i+1)) - f(xData(i+2)));
  elseif i == rows(xData)
    derivate1 = (1 / (2 * h)) * (-3*f(xData(i)) + 4*f(xData(i-1)) - f(xData(i-2)));
  else
    derivate1 = (1 / (2*h)) * (f(xData(i+1)) - f(xData(i-1)));
  endif


endfunction

function [derivate2] = getSecondDer(f, xData, i)
   h = xData(2) - xData(1);

  derivate2 = 0;

  if i == 1
    derivate2 = (1/ power(h, 2))*(2*f(xData(i)) - 5*f(xData(i+1)) + 4*f(xData(i+2)) - f(xData(i+3)));
  elseif i == rows(xData)
    derivate2 = (1/power(h, 2))*(2*f(xData(i)) - 5*f(xData(i-1)) + 4*f(xData(i-2)) - f(xData(i-3)));
  else
    derivate2 = (1 / power(h, 2))*(f(xData(i+1))- 2*f(xData(i)) + f(xData(i-1)));
  endif


endfunction
