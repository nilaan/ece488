syms th(t) T
f_eq = diff(th(t), t, 2)+diff(th(t), t)+sin(th) == T;
[eqs,vars] = reduceDifferentialOrder(f_eq, th(t));
[M,F] = massMatrixForm(eqs, vars);

f = M\F;
