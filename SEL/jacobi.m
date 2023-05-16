function metodo_jacobi_sel()
  A =  [-3, 1, -2
        4, -5, 0
        1, -3, 6];

  b = [-2; 5; 6];
  [x, found] = jacobi(A, b);
  x
  disp(A * x);

endfunction


function [x, found] = jacobi(A, b)
  n = rows(b);
  x = zeros(n, 1);
  found = false;
  iterations = 0;
  max_iter = 1000;
  tolerance = 0.0001;
  new_x = zeros(n, 1);
  
  for iterations=0 : max_iter

    for i=1 : n
      acc = 0;
      for j=1 : i-1
          acc += A(i, j) * x(j);
      endfor
      for j=i+1 : n
        acc += A(i, j) * x(j);
      endfor
      new_x(i) = (b(i) - acc) / A(i, i);
    endfor

    if infinite_norm(new_x - x) / infinite_norm(x) < tolerance
      found = true;
      return
    endif

    x = new_x;
  endfor

endfunction

function [n] = infinite_norm(x)
  n = max(abs(x));
endfunction

function metodo_potencia
  
  # Power method, used for finding eigenvectors and it's eigenvalues
  A = [-10, 4
       -4, 0];
  y = [2; 2]; 
  [eigenvector, eigenvalue] = power_method(A, y);
  
  # Prints the results of the algorithm
  eigenvector
  eigenvalue
  
  # Check if A * eigenvector = eigenvalue * eigenvector
  A * eigenvector
  eigenvalue * eigenvector
  
endfunction


function [eigenvector, eigenvalue] = power_method(A, y)
  max_iterations = 100;
  tolerance = 0.1;

  n = columns(A);
  new_y = zeros(n, 1);
  alpha = zeros(n, 1);

  for iterations=0 : max_iterations
    new_y = A * y;
    alpha = component_div(new_y, y);
    if (abs(alpha(1) - alpha(2)) < tolerance)
      break
    endif   
    y = new_y / infinite_norm(new_y);
  endfor

  iterations
  eigenvector = y;
  eigenvalue = alpha(1);
endfunction

function [out] = component_div(x, y)
 out = x; 
 for i=1 : rows(x)
   out(i) = out(i) / y(i);
 endfor
endfunction

function [norm] = infinite_norm(x)
  norm = max(abs(x));
endfunction