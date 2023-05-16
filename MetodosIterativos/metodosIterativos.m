#{
function metBiseccion()
  a = 0;
  b = 2;
  tol = 0.03;
  noSol = true;
  while(noSol)
    r = (a + b)/2;
    f = @(x)(x^3 +x*9)
    fr = f(r);
    fa = f(a);
    fb = f(b);
    if tol >= f(r)
      noSol = false;
    endif
    if f(a)*f(r) < 0
      b = r;
    elseif f(b)*f(r) < 0
      a = r;
    endif
   endwhile
   disp(r)
endfunction

function metRegulaFalsi()
  a = 0;
  b = 2;
  tol = 0.03;
  noSol = true;
  while(noSol)
    fa = f(a);
    fb = f(b);
    m = (fa-fb)/(a-b);
    r = a - fa/m;
    if tol >= f(r)
      noSol = false;
    endif
    if f(a)*f(r) < 0
      b = r;
    elseif f(b)*f(r) < 0
      a = r;
    endif
   endwhile
   fr = f(r);
   disp(fr)
endfunction


function metSecante()
  k = 0
  a = 0;
  b = 2;
  tol = 0.03;
  noSol = true;
  while(noSol)
    fa = f(a);
    fb = f(b);
    m = (fa-fb)/(a-b);
    r = a - fa/m;
    if tol >= f(r)
      noSol = false;
    endif
    b = a;
    a = r;
    k += 1
   endwhile
   fr = f(r);
   disp(fr)
endfunction

#}

function newtonRaphson()
  tolerancia = 0.03;
  iteracionesMax = 10;
  k = 0;
  a = 2;
  while(k < iteracionesMax)
    funcA = calc(a);  
    m = 1+2^(-a)*log(2);
    r = a-funcA/m;
    funcR = calc(r);
    k = k+1;
    if(abs(funcR) < tolerancia)
      break;
    endif
    a = r;
  endwhile
  fprintf('La raiz de la funcion es %d y la cantidad de iteraciones fue %d', r, k);
endfunction

function y = calc(x)
  y = x - 2^(-x);
endfunction

function punto_fijo
  f = @(x)(x*x - 3);
  start_x = 2;
  tolerance = 0.001;
  c = 0;
  alpha = - 1.0 / 3.0;
  max_iter = 10;
  found = false;
  [root, found] = search_root(f, c, start_x, alpha, tolerance, max_iter)
endfunction

function [root, found] = search_root (f, c, start_x, alpha, tolerance, max_iter)
  root = 0;
  found = false;
  x = start_x;
  g = @(x)(x + alpha * (f(x) - c));
  iterations = 0;
  while iterations < max_iter
    x = g(x);
    if abs(f(x) - c) < tolerance
      root = x;
      found = true;
      break
    endif
    iterations++;
  endwhile
endfunction



function [found, x] =  jacobi(A, c)
  n = rows(A)
  found = false
  maxIterations = 1000
  x = zeros(n, 1)
  x1 = zeros(n, 1)
  tol = 0.0002
  for iter=1 : maxIterations
    for i=1 : n:
      acc = 0
      for j=1 : i-1
        acc += A(i,j) * x(j)
      endfor
      for j=i+1 : n
        acc += A(i,j) * x(j)
      endfor
      x1(i) = (c(i) - acc)/A(i,i)
    endfor
    if (normInfinita(x1 - x))/normInfinita(x) <= tol
      found = true
      return
    x = x1
endfunction


function [norm] = normInfinita(x)
  norm = max(abs(x))
endfunction



